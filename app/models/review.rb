class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  enum      approve: [ :not_approved, :approved ]

  validates :rating,    presence: true,   numericality: { less_than_or_equal_to: 5 }
  validates :comment,   presence: true

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" }, default_url: "food.jpg"
                    
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
