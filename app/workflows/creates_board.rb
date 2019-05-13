class Createsboard
  attr_accessor :board
  attr_reader :success

  def initialize()
    @board = GamesHelper::generate_spaces
    @success = false
  end

  def build
    self.board = board
    board
  end

  def create
    build
    result = board.save!
    @success = result
  end

end
