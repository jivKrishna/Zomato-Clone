class FoodCategory < ApplicationRecord
  has_many :food_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
