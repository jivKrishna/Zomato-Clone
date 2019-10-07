class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: [ "in_progress", "shipped" ]
  enum payment_type: [ "cash_on_delivery", "online" ]

  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  private
    def update_status
      if self.status == nil?
        self.status = "in_progress"
      end
    end

    def update_total
      self.total_price = calculate_total
    end
end
