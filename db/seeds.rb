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
  restaurant = Restaurant.create(
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

  (0..3).each do |index|
    is_primary = index.zero? ? true : false
    restaurant_photo = RestaurantPhoto.create(photo: URI.parse("https://picsum.photos/200/?random").open, primary: is_primary, restaurant_id: restaurant.id)
    restaurant.restaurant_photos << restaurant_photo
  end

  user = User.where(email: 'roanborja@gmail.com').first
  if user.nil?
    user = User.create(email: 'roanborja@gmail.com', password: 'password', password_confirmation: 'password', first_name: 'Roan', last_name: 'Borja')
  end

  restaurant = Restaurant.create(
    name: "Panira Eatery",
    category_id: category.id,
    published: true,
    street_address: "Aparment Door 2, Balatas Road",
    city: "Naga City",
    zip: "4400",
    province: "Camarines Sur",
    country: "Philippines",
    price_range: "PhP40.00 - PhP50.00",
    phone: "09394954540",
    open_hours: "8AM - 10PM",
    user_id: user.id
  )

  (0..3).each do |index|
    is_primary = index.zero? ? true : false
    restaurant_photo = RestaurantPhoto.create(photo: URI.parse("https://picsum.photos/200/?random").open, primary: is_primary, restaurant_id: restaurant.id)
    restaurant.restaurant_photos << restaurant_photo
  end

  user = User.where(email: 'helenamilana@gmail.com').first
  if user.nil?
    user = User.create(email: 'helenamilana@gmail.com', password: 'password', password_confirmation: 'password', first_name: 'Helen', last_name: 'Amilana')
  end

  restaurant = Restaurant.create(
    name: "Elio Kinalas",
    category_id: category.id,
    published: true,
    street_address: "Dayangdang",
    city: "Naga City",
    zip: "4400",
    province: "Camarines Sur",
    country: "Philippines",
    price_range: "PhP15.00 - PhP50.00",
    phone: "09754729107",
    open_hours: "8AM - 10PM",
    user_id: user.id
  )

  (0..3).each do |index|
    is_primary = index.zero? ? true : false
    restaurant_photo = RestaurantPhoto.create(photo: URI.parse("https://picsum.photos/200/?random").open, primary: is_primary, restaurant_id: restaurant.id)
    restaurant.restaurant_photos << restaurant_photo
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
