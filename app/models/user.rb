class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :name, length: {minimum: 3, message: "should be minimum 3 characters long!"}, unless: ->{ name.blank? }
  validates :email, uniqueness: { scope: :provider }
end
