class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :food_items, dependent: :destroy
  has_many :reviews,    dependent: :destroy
  has_many :tables,     dependent: :destroy
  has_many :orders,     dependent: :destroy
  has_many :menu_cards, dependent: :destroy

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  after_validation :set_city

#for implementing elastic serach
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    self.as_json( 
      include: {
        restaurant_category: { only: :name },
        food_items: { only: [ :name, :veg, :price] },
        menu_cards: { only: :description }
      }
    )
  end
#---------------------------------
  
  scope :order_by_name, ->{ order(:name) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  before_save { self.owner_email = owner_email.downcase }

  validates :name,                                presence: true, length: { minimum: 3 }
  validates :owner_phone_number, :phone_number,   presence: true, length: { minimum: 10 }
  validates :email, :owner_email,                 presence: true, format: { with: VALID_EMAIL_REGEX,
            message: "only allows valid emails" }
            
  validates_format_of :owner_phone_number, :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/,
                      message: "Only positive number are allowed"

  has_attached_file :image, styles: { large: "300x760>",  medium: "300x600>", thumb: "200x200#" },
                    default_url: "banner.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private
    def set_city
      geocoder = Geocoder.search([ self.latitude, self.longitude ])
      self.city = geocoder.first.city
    end
end
