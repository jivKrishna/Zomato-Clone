# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin
User.create(
  name:                   "Krishna Pandit",
  email:                  "krishna@gmail.com",
  password:               "123456789",
  password_confirmation:  "123456789",
  image:                  URI.parse(Faker::Avatar.image).open,
  admin: true,
  phone_number:           "9876543210"
)
puts "Admin created..."

#10 Users
10.times do 
  User.create(
    name:                   Faker::Name.name,
    email:                  Faker::Internet.unique.email,
    password:               "123456789",
    password_confirmation:  "123456789",
    image:                  URI.parse(Faker::Avatar.image).open,
    phone_number:           Faker::PhoneNumber.cell_phone
  )
end
puts "10 Users created..."

#10 restaurants category
10.times do 
  RestaurantCategory.create(
    name:                     Faker::Restaurant.type
  )
end
puts "10 restaurant categories created..."

#For each restaurant categories 10 restaurants 
RestaurantCategory.all.each do |restaurant_category|
  rand(2..8).times do
    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  Faker::Placeholdit.image,
      email:                  Faker::Internet.unique.email,
      city:                   Faker::Address.city,
      address:                Faker::Address.full_address,
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )
  end
end
puts "for each restaurant category 2 to 8 restaurants created..."

#Food Category
i = 1
10.times do 
  FoodCategory.create(
    name:                     "Food-category-#{i}"
  )
  i += 1
end
puts "10 Food Categories created..."

#food items
Restaurant.all.each do |restaurant| 
  FoodCategory.all.each do |food_category|
    rand(3..7).times do 
      FoodItem.create(
        name:                  Faker::Food.dish,
        image:                 Faker::Placeholdit.image,
        price:                 Faker::Number.decimal(l_digits: 3, r_digits: 2),
        veg:                   Faker::Number.between(from: 0, to: 2),
        food_category_id:      food_category.id,
        restaurant_id:         restaurant.id
      )
    end
  end
end
puts "For each restaurant and for each food category 3 to 7 food dishes created..."

#restaurant reviews
User.all.each do |user|
  Restaurant.all.each do |restaurant|
    rand(1..9).times do
      Review.create(
        rating:                 Faker::Number.between(from: 1, to: 5),
        comment:                Faker::Food.description,
        # image:                  Faker::Placeholdit.image,
        approve:                Faker::Number.between(from: 0, to: 1),
        user_id:                user.id,
        restaurant_id:          restaurant.id
      )
    end
  end
end
puts "For each user and for each restaurant 1 to 9 reviews created..."