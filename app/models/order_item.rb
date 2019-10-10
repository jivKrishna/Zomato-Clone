class OrderItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :order

  before_save :do_subtotal

  private
    def do_subtotal
      self.sub_total = self.food_item.price * self.quantity
    end
end
