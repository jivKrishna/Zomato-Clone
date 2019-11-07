class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :food_items, dependent: :destroy
  has_many :reviews,    dependent: :destroy
  has_many :booking_tables,     dependent: :destroy
  has_many :orders,     dependent: :destroy
  has_many :menu_cards, dependent: :destroy

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  after_validation :set_city

  scope :order_by_name, ->{ order(:name) }

#for implementing elastic serach
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options={})
    self.as_json( 
      only: [ :name, :city, :address, :website, :longitude, :latitude, :serve_alcohal ],
      include: {
        restaurant_category: { only: :name },
        food_items: { only: [ :name, :veg, :price] },
        menu_cards: { only: :description }
      }
    )
  end
  
#for validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  before_save { self.owner_email = owner_email.downcase }

  validates :name,                                presence: true, length: { minimum: 3 }
  validates :owner_phone_number, :phone_number, :image,  presence: true
  validates :email, :owner_email,                 presence: true, format: { with: VALID_EMAIL_REGEX }
            
  validates_format_of :owner_phone_number, :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/

  validates_format_of :secondary_phone_number, :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/, if: ->{ secondary_phone_number.present? }

  has_attached_file :image, styles: { large: "300x760>",  medium: "300x600>", thumb: "200x200#" }, default_url: "banner.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private
    def set_city
      geocoder = Geocoder.search([ self.latitude, self.longitude ])
      self.city = geocoder.first.city
    end
end
