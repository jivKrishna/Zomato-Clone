class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.attachment :image
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :secondary_phone_number
      t.string :owner_email, null: false
      t.string :owner_phone_number, null: false
      t.string :website
      t.string :address, null: false
      t.boolean :serve_alcohal, null: false
      t.belongs_to :restaurant_category, null: false
      
      t.timestamps
    end
  end
end
