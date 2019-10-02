class FoodCategory < ApplicationRecord
  has_many :foods, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
