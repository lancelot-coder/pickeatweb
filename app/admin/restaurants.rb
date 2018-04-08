ActiveAdmin.register Restaurant do
  index do
    column :name
    column :address
    column :phone
    column :open_hours
    column :price_range
    column :published
    actions
  end

  filter :address
  filter :title

  permit_params :name, :address, :phone, :published, :price_range, :open_hours

  form do |f|
    inputs 'Details' do
      input :name
      input :address
      input :phone
      input :price_range
      input :open_hours
      input :published
    end
    actions
  end

  show do
    attributes_table do
      row :name
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
