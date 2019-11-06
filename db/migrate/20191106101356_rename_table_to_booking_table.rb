class RenameTableToBookingTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :tables, :booking_tables
  end
end
