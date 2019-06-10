class Space < ApplicationRecord
  validates :space_type, presence: true, allow_blank: false
  validates :destination, allow_nil: true, numericality: { only_integer: true }

  def initialization
    self.check_type
    self.check_destination
  end

  def check_type
    valid_values = ["empty", "chute", "ladder"]
    raise StandardError.new("Error, incorrect type, can only be: empty, ladder, chute") unless valid_values.include?(space_type)
  end

  def check_destination
    if(destination < 1)
      raise StandardError.new("Error, Can't do negative number for a destination")
    end
  end
end
