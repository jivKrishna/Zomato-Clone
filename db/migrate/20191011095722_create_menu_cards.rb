class CreateMenuCards < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_cards do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.attachment :image, null: false
      
      t.timestamps
    end
  end
end
