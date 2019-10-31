class RestaurantCategory < ApplicationRecord
  has_many :restaurants, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 3, message: "only allows valid emails" },
             uniqueness: { case_sensitive: false }
end
