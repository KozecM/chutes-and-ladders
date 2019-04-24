class Game < ApplicationRecord

  has_many :players
  attr_accessor :currently_rolling, :board

  # def initialize(players)
  #   @players = players
  #   @currently_rolling = players[0]
  #   @board = []
  #   generate_spaces
  # end

  def change_turn
    current_name = currently_rolling.name
    player_names = players.collect {|player| player.name }
    player_index = player_names.find_index(current_name)
    player_index += 1
    @currently_rolling = players[player_index % players.size]
  end

  def generate_spaces
    initialized_spaces = []
    Spaces::SPACESDATA.each do |data|
      initialized_spaces << Space.new(data)
    end
    initialized_spaces.each { |space| @board << space }
  end

  def roll
    roll = Dice::roll
    currently_rolling.move(roll)
    update_position
  end

  def update_position
    current_space = board[currently_rolling.position - 1]
    if current_space.type != "empty"
      currently_rolling.set_position(current_space.destination)
    else
      return
    end
  end
end
