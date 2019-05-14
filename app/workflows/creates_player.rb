class CreatesPlayer
  attr_accessor :name, :position, :player
  attr_reader :success

  def initialize(name: "")
    @name = name
    @position = 1
    @success = false
  end

  def build
    self.player = Player.new(name: name)
    player.position = position
    player
  end

  def create
    build
    result = player.save!
    @success = result
  end

end
