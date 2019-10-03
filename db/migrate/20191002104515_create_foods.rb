class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.attachment :image
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :veg, null: false
      t.references :restaurant, null: false, foreign_key: true
      t.belongs_to :food_category, null: false

      t.timestamps
    end
  end
end
