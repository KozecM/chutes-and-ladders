class Game
  attr_reader :players
  attr_accessor :currently_rolling

  def initialize(players)
    @players = players
    @currently_rolling = players[0]
  end

  def change_turn
    current_name = currently_rolling.name
    player_names = players.collect {|player| player.name }
    player_index = player_names.find_index(current_name)
    player_index += 1
    @currently_rolling = players[player_index % players.size]
  end
end