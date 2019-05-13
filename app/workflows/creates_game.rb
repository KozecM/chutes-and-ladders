class CreatesGame
  attr_accessor :name, :game
  def initialize(name: "")
    @name = name
  end

  def build
    self.game = Game.new(name: name)
    game.players = []
    game.spaces = GamesHelper::generate_spaces
    game
  end

  def create
    build
    result = game.save
  end

  # def generate_players
  #   game_players = []
  #   player_names = [player_one_name, player_two_name]

  #   player_names.each do |p_name|
  #     game_players << Player.new(name: p_name, position: 1)
  #   end
  #   game_players
  # end

end
