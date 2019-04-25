class Game < ApplicationRecord

  has_many :players
  has_many :spaces
  attr_accessor :currently_rolling, :board

  def change_turn
    current_name = currently_rolling.name
    player_names = players.collect {|player| player.name }
    player_index = player_names.find_index(current_name)
    player_index += 1
    @currently_rolling = players[player_index % players.size]
  end

  def roll_for(player_name)
    roll = Dice::roll
    players.each do |player|
      if player.name == player_name
        player.move(roll)
      end
    end
  end

  def update_position_for(player_name)
    players.each do |player|
      if player.name == player_name
        current_position = player.read_attribute(:position)
        space = spaces[current_position - 1]
        if space.destination
          player.set_position(space.destination)
        end
      end
    end
  end

end
