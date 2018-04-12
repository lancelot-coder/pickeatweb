ActiveAdmin.register Restaurant do
  menu parent: "Restaurants"
  index do
    column :name
    column :street_address
    column :province
    column :city
    column :zip
    column :country
    column :description
    column :phone
    column :open_hours
    column :price_range
    column :category
    column :user
    column :published
    actions
  end

  filter :address
  filter :title

  permit_params :name, :description, :category, :user, :phone, :published, :price_range, :open_hours, :street_address, :province, :city, :zip, :country
  
  form do |f|
    inputs 'Details' do
      input :name
      input :street_address
      input :province
      input :city
      input :zip
      input :country, as: :select, collection: ActionView::Helpers::FormOptionsHelper::COUNTRIES, selected: "Philippines"
      input :description
      input :phone
      input :price_range
      input :open_hours
      input :category
      input :user, as: :select, collection: User.all.collect {|user| [user.email, user.id] }
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
      row :street_address
      row :province
      row :city
      row :zip
      row :country
      row :description
      row :phone
      row :price_range
      row :open_hours
      row :category
      row :user
      row :published
    end
  end

  config.sort_order = 'name_asc'
  config.batch_actions = false
end
