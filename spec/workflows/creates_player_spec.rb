class CreatesPlayer
  attr_accessor :name, :position, :player
  attr_reader :success

  def initialize(name: "", position: 1)
    @name = name
    @position = position
    @success = false
  end

  def build
    self.player = Player.new(name: name, position: position)
    player
  end

  def create
    build
    result = player.save!
    @success = result
  end

end
