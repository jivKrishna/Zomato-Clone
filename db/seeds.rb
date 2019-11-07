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
5.times do 
  User.create(
    name:                   Faker::Name.name,
    email:                  Faker::Internet.unique.email,
    password:               "123456789",
    password_confirmation:  "123456789",
    image:                  URI.parse(Faker::Avatar.image).open,
    phone_number:           Faker::PhoneNumber.cell_phone
  )
end
puts "5 Users created..."

#10 restaurants category
rand(4..6).times do 
  RestaurantCategory.create(
    name:                     Faker::Restaurant.type
  )
end
puts "4 to 6 restaurant categories created..."

#For each restaurant categories 10 restaurants 
RestaurantCategory.all.each do |restaurant_category|
  rand(3..4).times do
    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      latitude:               rand(22.545726153..22.5748512),
      longitude:              rand(88.323639153..88.3745112),
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )
  end
end
puts "for each restaurant category 1 to 2 restaurants created..."

#Food Category
FoodCategory.create(
  name:                     "Snacks"
)

FoodCategory.create(
  name:                     "Vegitables"
)

FoodCategory.create(
  name:                     "Ice Cream"
)

puts "3 Food Categories created..."

#food items
Restaurant.all.each do |restaurant| 
  FoodCategory.all.each do |food_category|
    rand(2..4).times do 
      FoodItem.create(
        name:                  Faker::Food.dish,
        image:                  File.new("#{Rails.root}/app/assets/images/food.jpg"),
        price:                 Faker::Number.decimal(l_digits: 1, r_digits: 2),
        veg:                   Faker::Number.between(from: 0, to: 2),
        food_category_id:      food_category.id,
        restaurant_id:         restaurant.id
      )
    end
  end
end
puts "For each restaurant and for each food category 2 to 4 food dishes created..."

#restaurant reviews
User.all.each do |user|
  Restaurant.all.each do |restaurant|
    rand(1..2).times do
      Review.create(
        rating:                 Faker::Number.between(from: 1, to: 5),
        comment:                Faker::Food.description,
        # image:                  File.new("#{Rails.root}/app/assets/images/restaurant.jpg"),
        approve:                Faker::Number.between(from: 0, to: 1),
        user_id:                user.id,
        restaurant_id:          restaurant.id
      )
    end
  end
end
puts "For each user and for each restaurant 1 to 2 reviews created..."

#menu-cards
Restaurant.all.each do |restaurant|
  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu1.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design."
  )

  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu2.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design."
  )

end
puts "For each restaurant 2 menu cards created..."

Restaurant.import