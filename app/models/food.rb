class Food < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 50, mesaage: "Minimum 50 chars needed!" } 
  validates :price, :veg, presence: true

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
