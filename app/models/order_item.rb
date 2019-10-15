class OrderItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :order

  #for implementing elastic serach
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase
#---------------------------------

  before_save :do_subtotal

  validates  :quantity,   :sub_total,   presence: true

  private
    def do_subtotal
      self.sub_total = self.food_item.price * self.quantity
    end
end
