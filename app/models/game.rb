class Game
  attr_reader :players
  attr_accessor :currently_rolling, :board

  def initialize(players)
    @players = players
    @currently_rolling = players[0]
    @board = []
    generate_spaces
  end

  def change_turn
    current_name = currently_rolling.name
    player_names = players.collect {|player| player.name }
    player_index = player_names.find_index(current_name)
    player_index += 1
    @currently_rolling = players[player_index % players.size]
  end

  def generate_spaces
    initialized_spaces = []
    Spaces::SPACESDATA.each do |data|
      initialized_spaces << Space.new(data)
    end
    initialized_spaces.each { |space| @board << space }
  end
end
