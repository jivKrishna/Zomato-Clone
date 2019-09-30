class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.boolean :veg
      t.references :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
