class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, default: 1
      t.decimal :sub_total, default: 0
      t.references :food_item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end