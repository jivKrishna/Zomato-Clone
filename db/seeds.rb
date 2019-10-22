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
rand(5..8).times do 
  RestaurantCategory.create(
    name:                     Faker::Restaurant.type
  )
end
puts "5 to 8 restaurant categories created..."

#For each restaurant categories 10 restaurants 
RestaurantCategory.all.each do |restaurant_category|
  rand(4..8).times do
    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
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

    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      city:                   "Serampore",
      address:                "Serampore, 712201",
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )


    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      city:                   "Kolkata",
      address:                "Kolkata, Newtown",
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )

    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      city:                   "Kolkata",
      address:                "Kolkata, Newtown",
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )

    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      city:                   "Kolkata",
      address:                "Kolkata, Rajarhat",
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )

    restaurant_category.restaurants.create(
      name:                   Faker::Restaurant.name,
      image:                  File.new("#{Rails.root}/app/assets/images/banner.jpg"),
      email:                  Faker::Internet.unique.email,
      city:                   "Howrah",
      address:                "Howrah, Liluah",
      phone_number:           Faker::PhoneNumber.cell_phone,
      secondary_phone_number: Faker::PhoneNumber.cell_phone,
      owner_email:            Faker::Internet.unique.email,
      owner_phone_number:     Faker::PhoneNumber.cell_phone,
      website:                Faker::Internet.domain_name,
      serve_alcohal:          Faker::Boolean.boolean
    )
end
puts "for each restaurant category 4 to 8 restaurants created..."
puts "Near by Kolkata 5 restaurants created..."


#Food Category
FoodCategory.create(
  name:                     "Snacks"
)

FoodCategory.create(
  name:                     "Cafe"
)

FoodCategory.create(
  name:                     "Vegitables"
)

FoodCategory.create(
  name:                     "Ice Cream"
)

FoodCategory.create(
  name:                     "Ice Cream"
)

FoodCategory.create(
  name:                     "Spicy"
)

FoodCategory.create(
  name:                     "Fast food"
)

FoodCategory.create(
  name:                     "Sweets"
)

puts "7 Food Categories created..."

#food items
Restaurant.all.each do |restaurant| 
  FoodCategory.all.each do |food_category|
    rand(3..7).times do 
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
puts "For each restaurant and for each food category 3 to 7 food dishes created..."

#restaurant reviews
User.all.each do |user|
  Restaurant.all.each do |restaurant|
    rand(2..4).times do
      Review.create(
        rating:                 Faker::Number.between(from: 1, to: 5),
        comment:                Faker::Food.description,
        image:                  File.new("#{Rails.root}/app/assets/images/restaurant.jpg"),
        approve:                Faker::Number.between(from: 0, to: 1),
        user_id:                user.id,
        restaurant_id:          restaurant.id
      )
    end
  end
end
puts "For each user and for each restaurant 2 to 4 reviews created..."

#menu-cards
Restaurant.all.each do |restaurant|
  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu1.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design,
                               typography, layout, and printing in place of English to 
                               emphasise design elements over content. It's also called 
                               placeholder (or filler) text. It's a convenient tool for 
                               mock-ups."
  )

  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu2.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design,
                               typography, layout, and printing in place of English to 
                               emphasise design elements over content. It's also called 
                               placeholder (or filler) text. It's a convenient tool for 
                               mock-ups."
  )

  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu3.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design,
                               typography, layout, and printing in place of English to 
                               emphasise design elements over content. It's also called 
                               placeholder (or filler) text. It's a convenient tool for 
                               mock-ups."
  )

  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu4.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design,
                               typography, layout, and printing in place of English to 
                               emphasise design elements over content. It's also called 
                               placeholder (or filler) text. It's a convenient tool for 
                               mock-ups."
  )

  restaurant.menu_cards.create(
    image:                  File.new("#{Rails.root}/app/assets/images/menu5.jpg"),
    description:              "Lorem ipsum is a pseudo-Latin text used in web design,
                               typography, layout, and printing in place of English to 
                               emphasise design elements over content. It's also called 
                               placeholder (or filler) text. It's a convenient tool for 
                               mock-ups."
  )
end
puts "For each restaurant 5 menu cards created..."

Restaurant.import