class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.boolean :owner_flag
      t.string :owner_phone_number
      t.string :owner_email
      t.string :phone_number
      t.string :secondary_phone_number
      t.string :email
      t.boolean :serve_alcohal
      t.string :website
      t.string :address
      t.belongs_to :restaurant_category
      
      t.timestamps
    end
  end
end
