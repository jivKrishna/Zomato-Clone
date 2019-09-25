class User < ApplicationRecord
  validates :full_name, :email, presence: true
  validates :full_name, length: {minimum: 3, message: "should be minimum 3 characters long!"}, unless: ->{ full_name.blank? }
  validates :email, uniqueness: true
end
