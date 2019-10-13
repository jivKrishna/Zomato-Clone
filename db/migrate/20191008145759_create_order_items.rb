class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer     :quantity,     null: false,     default: 1
      t.decimal     :sub_total,    null: false,     default: 0
      t.references  :food_item,    null: false,     foreign_key: true
      t.references  :order,        null: false,     foreign_key: true

      t.timestamps
    end
  end
end