class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string      :name,          null: false
      t.decimal     :price,         null: false, default: 1
      t.integer     :veg,           null: false, default: 0
      t.attachment  :image,         null: false
      t.references  :food_category, null: false, foreign_key: true
      t.references  :restaurant,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
