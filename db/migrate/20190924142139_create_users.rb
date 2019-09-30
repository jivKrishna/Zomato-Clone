class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :name
      t.string :email
      t.text :image
      t.string :provider
      t.string :uid
      
      t.timestamps
    end
  end
end
