class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.attachment :image
      t.string :email
      t.string :phone_number
      t.string :owner_email
      t.string :owner_phone_number
      t.string :website
      t.string :address
      t.string :secondary_phone_number
      t.boolean :serve_alcohal
      t.belongs_to :restaurant_category
      
      t.timestamps
    end
  end
end
