class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.references :user,               null: false, foreign_key: true
      t.references :restaurant,         null: false, foreign_key: true
      t.integer    :guest_number,       null: false
      t.date       :booking_date,       null: false
      t.time       :booking_time,       null: false
      t.string     :guest_first_name,   null: false
      t.string     :guest_last_name,    null: false
      t.string     :guest_email,        null: false
      t.string     :guest_phone_number, null: false

      t.timestamps
    end
  end
end
