class AddColumnsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :slug, :string
    add_column :restaurants, :address, :string
  end
end
