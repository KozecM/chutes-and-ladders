class Game < ActiveRecord:
  has_many :players
  validates :name, presence: true, allow_blank: false
  attr_accessor :board, :currently_rolling, :players
  
  def initialize
    @board = Board.new
    @players = players
  end

  def add_player(name)
    players.push(Player.new(name: name))
  end

  def change_turn
    player_index += 1
    @currently_rolling = players[players.size % player_index]
  end

  def roll_for(player_name)
    player.move(Dice::roll)
  end

end
