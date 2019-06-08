class Player < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :position, presence:true, numericality: { only_integer: true }
  validates :game_id, presence:true, numericality:{only_integer:true}
  belongs_to :game, optional: true

  def move(roll)
    new_position = calculate_position(roll)

    if valid_position?(new_position)
      set_position(new_position)
    end
  end

  def set_position(board_position)
    self.update_attribute(:position, board_position)
  end

  def calculate_position(roll)
    self.read_attribute(:position) + roll
  end

  def perform(big_dependency)
    big_dependency.execute
    return "we done"
  end

  private

  def valid_position?(position)
    (0 < position) and (position < 101)
  end

end
