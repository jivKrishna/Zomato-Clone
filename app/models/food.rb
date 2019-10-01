class Food < ApplicationRecord
  belongs_to :restaurant
  has_attached_file :image, style: { large: "720x400>", medium: "400x300>", thumb: "200x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
end
