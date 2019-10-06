class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :guest_number
      t.date :booking_date
      t.time :booking_time
      t.string :guest_first_name
      t.string :guest_last_name
      t.string :guest_email
      t.string :guest_phone_number

      t.timestamps
    end
  end
end
