class User < ApplicationRecord
  validates :full_name, :email, presence: true
  validates :full_name, length: {minimum: 3, message: "should be minimum 3 characters long!"}, unless: ->{ full_name.blank? }
  validates :email, uniqueness: true

  def sel.sign_in_from_omniauth(auth)
    find_by(provider: auth["provider"], uid: auth["uid"]) || create_user_from_omiauth(auth)
  end

  def create_user_from_omniauth(auth)
    create(
      name: auth["info"]["name"],
      email: auth["info"]["email"],
      image: auth["info"]["image"],
      provider: auth["provider"],
      uid: auth["uid"]
    )
  end
end
