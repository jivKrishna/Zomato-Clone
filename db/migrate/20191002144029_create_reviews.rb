class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer     :rating, null: false
      t.text        :comment, null: false
      t.attachment  :image
      t.integer     :approve,     null: false,     default: 0
      t.references  :user,        null: false,     foreign_key: true
      t.references  :restaurant,  null: false,     foreign_key: true

      t.timestamps
    end
  end
end
