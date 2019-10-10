class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :tables,  dependent: :destroy
  has_many :orders,  dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }

  validates :email, presence: true, length: { maximum: 105 }, uniqueness: {scope: :provider, case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: { case_sensitive: true }, unless: Proc.new { |a| a.password.blank? }

  has_attached_file :image, styles: { large: "300x760>", medium: "300x600>", thumb: "200x200#" },
                            default_url: "default_img.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
