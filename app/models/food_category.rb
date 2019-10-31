class FoodCategory < ApplicationRecord
  has_many :food_items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
end
