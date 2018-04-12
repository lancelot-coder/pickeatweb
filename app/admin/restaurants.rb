ActiveAdmin.register Restaurant do
  menu parent: "Restaurants"
  index do
    column :name
    column :description
    column :address
    column :phone
    column :open_hours
    column :price_range
    column :published
    actions
  end

  filter :address
  filter :title

  permit_params :name, :description, :address, :phone, :published, :price_range, :open_hours

  form do |f|
    inputs 'Details' do
      input :name
      input :description
      input :address
      input :phone
      input :price_range
      input :open_hours
      input :published
    end
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  show do
    attributes_table do
      row :name
      row :description
      row :address
      row :phone
      row :price_range
      row :open_hours
      row :published
    end
  end

  config.sort_order = 'name_asc'
  config.batch_actions = false
end
