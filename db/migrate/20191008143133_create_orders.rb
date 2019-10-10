class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.float :total_price, default: 0
      t.integer :status, default: 0
      t.datetime :placed_at
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
