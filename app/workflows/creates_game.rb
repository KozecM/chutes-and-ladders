class CreatesGame
  attr_accessor :name, :player_one_name, :player_two_name, :game
  def initialize(name: "", player_one_name: "", player_two_name: "")
    @name = name
    @player_one_name = player_one_name
    @player_two_name = player_two_name
  end

  def build
    self.game = Game.new(name: name, player_one_name: player_one_name, player_two_name: player_two_name)
    game.players = generate_players
    game.spaces = GamesHelper::generate_spaces
    game.currently_rolling = game.players[0] 
    game
  end

  def create
    build
    result = game.save
  end

  def generate_players
    game_players = []
    player_names = [player_one_name, player_two_name]

    player_names.each do |name|
      game_players << Player.new(name: name, position: 1)
    end
    game_players
  end

end
