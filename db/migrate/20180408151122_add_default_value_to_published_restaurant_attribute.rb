class AddDefaultValueToPublishedRestaurantAttribute < ActiveRecord::Migration[5.1]
  def up
    change_column :restaurants, :published, :boolean, default: false
  end
  
  def down
    change_column :restaurants, :published, :boolean, default: nil
  end
end
