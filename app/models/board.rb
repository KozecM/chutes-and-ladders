class Board
  attr_reader :spaces

  def initialize
    @spaces = GamesHelper::generate_spaces
  end

  def space_destination(location)
    access_space_at(location).destination
  end

  def space_type(location)
    access_space_at(location).type
  end

  private

  def access_space_at(location)
    spaces[location - 1]
  end
end