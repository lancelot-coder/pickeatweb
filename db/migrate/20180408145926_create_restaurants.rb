class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      t.string :street_address
      t.string :city
      t.string :province
      t.string :zip
      t.string :country
      t.boolean :published
      t.string :phone
      t.string :open_hours
      t.string :price_range
      t.integer :category_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
