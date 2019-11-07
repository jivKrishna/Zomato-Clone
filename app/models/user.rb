class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :booking_tables,  dependent: :destroy
  has_many :orders,  dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }

  validates :name,      presence: true, length: { minimum: 3 }
  validates :email,     presence: true, length: { maximum: 105 }, uniqueness: { scope: :provider, case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  
  validates :password,  confirmation:   { case_sensitive: true }, if: ->{ password.present? }

  validates_format_of :phone_number,  with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/, if: ->{ phone_number.present? }

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" }, default_url: "default_img.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
