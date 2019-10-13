class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean     :admin,            default: false
      t.string      :name,             null: false
      t.string      :email,            null: false
      t.string      :phone_number
      t.string      :password_digest
      t.attachment  :image
      t.string      :provider,         default: "email"
      t.string      :uid
      
      t.timestamps
    end
  end
end
