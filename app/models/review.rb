class Review < ApplicationRecord
  belongs_to :restaurant

  validates :context, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, comparison: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
end
