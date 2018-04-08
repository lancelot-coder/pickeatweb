class CreateRestaurantPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_photos do |t|
      t.attachment :photo
      t.boolean :primary, default: false
      t.integer :restaurant_id

      t.timestamps
    end

    add_index :restaurant_photos, :restaurant_id
  end
end
