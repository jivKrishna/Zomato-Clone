class Order < ApplicationRecord
  has_many :food_items, dependent: :destroy
  belongs_to :restaurant
  belongs_to :user

  enum status: [ "packed", "on_delivery", "delivered" ]
  enum payment_type: [ "cash_on_delivery", "online" ]
end
