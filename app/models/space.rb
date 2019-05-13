class Space < ApplicationRecord
  belongs_to :board
  validates :space_type, presence: true
  validates :destination, allow_nil:true, numericality: { only_integer: true }
end
