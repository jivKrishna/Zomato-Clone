class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :admin, default: false
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.attachment :image
      t.string :provider, default: "email"
      t.string :uid
      
      t.timestamps
    end
  end
end
