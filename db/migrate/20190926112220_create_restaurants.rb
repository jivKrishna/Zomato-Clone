class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.boolean :owner_flag
      t.string :owner_phone_number
      t.string :owner_email
      t.string :restaurant_type
      t.string :phone_number
      t.string :secondary_phone_number
      t.string :email
      t.string :website
      t.string :address
      t.time :open_time
      t.time :close_time

      t.timestamps
    end
  end
end
