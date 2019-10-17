class Order < ApplicationRecord
  belongs_to  :user
  belongs_to  :restaurant
  has_many    :order_items,    dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  enum        status: [ "pending", "in_progress", "delivered" ]
  before_save :update_total
  validates   :total_price,   :status,   presence: true

  private
    def calculate_total
      self.order_items.collect { |order_item| order_item.sub_total }.sum
    end

    def update_total
      self.total_price = calculate_total
    end
end
