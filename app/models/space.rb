class Space < ApplicationRecord
  validates :space_type, presence: true, allow_blank: false
  validates :destination, allow_nil: true, numericality: { only_integer: true }
end
