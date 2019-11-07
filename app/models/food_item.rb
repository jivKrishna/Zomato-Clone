class FoodItem < ApplicationRecord
  belongs_to :food_category
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy

  enum         veg: [ :veg, :egg, :non_veg ]

  validates   :name,                     presence: true,   length: { minimum: 3 }
  validates   :price,  :image,   :veg,   presence: true

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" }, default_url: "food.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
