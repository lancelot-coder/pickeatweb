ActiveAdmin.register RestaurantPhoto do
  menu parent: "Restaurants"
  index do
    column :photo
    column :restaurant
    column :primary
    actions
  end

  filter :restaurant

  permit_params :photo, :restaurant, :primary

  form do |f|
    inputs 'Details' do
      input :photo
      input :restaurant
      input :primary
    end
    actions
  end

  controller do
    def find_resource
      scoped_collection.find(params[:id])
    end
  end

  show do
    attributes_table do
      row :photo do |restaurant_photo|
        image_tag restaurant_photo.photo.url(:thumb)
      end
      row :restaurant
      row :primary
    end
  end

  config.batch_actions = false
end
