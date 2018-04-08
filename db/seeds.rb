# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w(italian japanese korean filipino american chinese taiwanese vietnamese).each do |category|
  Category.where(title: category, published: true).first_or_create
end

if Restaurant.all.empty?
  user = User.where(email: 'nymphareyes@gmail.com').first
  if user.nil?
    user = User.create(email: 'nymphareyes@gmail.com', password: 'password', password_confirmation: 'password', first_name: 'Nympha', last_name: 'Reyes')
  end

  category = Category.find_by(title: 'filipino')
  Restaurant.create(
    name: "Prime Food Enterprise",
    category_id: category.id,
    published: true,
    street_address: "Balatas Road",
    city: "Naga City",
    zip: "4400",
    province: "Camarines Sur",
    country: "Philippines",
    price_range: "PhP20.00 - PhP30.00",
    phone: "09085404643",
    open_hours: "8AM - 10PM",
    user_id: user.id
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
