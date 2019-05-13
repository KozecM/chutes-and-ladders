class CreatesGame
  attr_accessor :game, :name, :players
  def initialize(name: "")
    @name = name
  end

  def build
    self.name = name
    self.game = Game.new
    self
  end

  def create
    build
    result = game.save
  end

end
