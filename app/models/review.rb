class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  enum approve: [:not_approved, :approved]

  validates :rating,  presence: true, numericality: { less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 100 }

end
