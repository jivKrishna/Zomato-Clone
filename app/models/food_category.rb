class FoodCategory < ApplicationRecord
  has_many :food_items, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
