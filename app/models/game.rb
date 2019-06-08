class Game < ApplicationRecord

  has_many :players
  has_many :spaces
  validates :name, presence: true, allow_blank: false

  def roll(players, dice)
    current_player = get_current_player
    current_player.move(dice.roll)
    update_position_for(current_player)
    change_turn(players)
  end

  def change_turn(players)    
    players = players.rotate
  end

  def get_current_player
    players.first
  end

  def perform(big_dependency)
    big_dependency.execute
    return "Game over man! Game over."
  end

  def update_position_for(current_player)
    space = spaces[current_player.read_attribute(:position) - 1]

    if space.destination
      current_player.position = space.destination
    end
  end


end
