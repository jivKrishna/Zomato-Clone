class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references  :user,         null: false,   foreign_key: true
      t.references  :restaurant,   null: false,   foreign_key: true
      t.float       :total_price,  null: false,   default: 0
      t.integer     :status,       null: false,   default: 0
      t.datetime    :placed_at
      t.string      :address
      t.float       :latitude,     null: false 
      t.float       :longitude,    null: false

      t.timestamps
    end
  end
end
