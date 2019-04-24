class CreatesGame
  attr_accessor :name, :player_one_name, :player_two_name, :game
  def initialize(name: "", player_one_name: "", player_two_name: "")
    @name = name
    @player_one_name = player_one_name
    @player_two_name = player_two_name
  end

  def build
    self.game = Game.new(name: name, player_one_name: player_one_name, player_two_name: player_two_name)
    game
  end

  def create
    build
    result = game.save
  end

end
