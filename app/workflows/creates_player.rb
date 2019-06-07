class CreatesPlayer
  attr_accessor :name, :position, :player, :game_id
  attr_reader :success

  def initialize(name: "", game_id: "")
    @name = name
    @position = 1
    @success = false
    @game_id = game_id
  end

  def build
    self.player = Player.new(name: name)
    player.position = position
    player.game_id = game_id
    player
  end

  def create
    build
    result = player.save
    @success = result
  end

end
