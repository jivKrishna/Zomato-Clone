class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.text :image
      t.string :provider
      t.string :uid
      
      t.timestamps
    end
  end
end
