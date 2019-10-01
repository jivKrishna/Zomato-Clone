class RestaurantCategory < ApplicationRecord
  has_many :restaurants, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
end
