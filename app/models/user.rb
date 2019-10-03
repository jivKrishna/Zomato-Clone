class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }

  validates :email, presence: true, length: { maximum: 105 }, uniqueness: {scope: :provider, case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: { case_sensitive: true }, unless: Proc.new { |a| a.password.blank? }
  
  
end
