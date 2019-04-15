class Player
  attr_reader :name
  attr_reader :space

  def initialize(**options)
    @name = options[:name]
    @space = options[:space] || 1
    
    validate_space(space)
  end

  def move_forward(spaces)
    set_space(space + spaces)
  end

  def move_backwards(spaces)
    set_space(space - spaces)
  end

  def set_space(board_space)
    validate_space(board_space)
    @space = board_space
  end

  private
  
  def validate_space(board_space)
    if board_space > 100 or board_space < 1
      raise ArgumentError.new("Can't have space greater than 100
        or less than 1.")
    end
  end

end