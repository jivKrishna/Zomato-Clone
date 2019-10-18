class AddColumndistanceToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :distance, :float
  end
end
