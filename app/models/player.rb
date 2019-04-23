class Player < ApplicationRecord
  belongs_to :game
  # attr_reader :name, :position

  # def initialize(**options)
  #   @name = options[:name]
  #   @position = options[:position] || 1
    
  #   validate_position(position)
  # end

  def move(roll)
    new_position = calculate_position(roll)

    if valid_position?(new_position)
      set_position(new_position)
    end
  end

  def set_position(board_position)
    validate_position(board_position)
    self.position = board_position
  end

  def calculate_position(roll)
    self.position + roll
  end

  private

  def valid_position?(position)
    (0 < self.position) and (self.position < 101)
  end
  
  def validate_position(board_position)
    if board_position > 100 or board_position < 1
      raise ArgumentError.new("Can't have position greater than 100
        or less than 1.")
    end
  end

end
