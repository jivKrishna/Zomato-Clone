class CreateOrderFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :order_foods do |t|
      t.integer :quantity, null: false, default: 1
      t.references :food_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
