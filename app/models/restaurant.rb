class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  
  has_many :food_items, dependent: :destroy
  has_many :reviews,    dependent: :destroy
  has_many :tables,     dependent: :destroy
  has_many :orders,     dependent: :destroy
  has_many :menu_cards, dependent: :destroy

  scope :order_by_name, ->{ order(:name) }

  validates :name, :city, :address, presence: true, length: { minimum: 3 }
  validates :owner_phone_number, :phone_number, presence: true, length: { minimum: 10 }
  validates_format_of :owner_phone_number, :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/, message: "Only positive number without spaces are allowed"
  validates :email, :owner_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" },
                    default_url: "https://placehold.it/300.png/09f/fff?text=Restaurant"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
