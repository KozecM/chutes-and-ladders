class CreatesSpace
  attr_accessor :space_type, :destination, :space
  attr_reader :success

  def initialize(space_type: "empty", destination: nil)
    @space_type = space_type
    @destination = destination
    @success = false
  end

  def build
    self.space = Space.new(space_type: space_type, destination: destination)
    space
  end

  def create
    build
    result = space.save!
    @success = result
  end

end
