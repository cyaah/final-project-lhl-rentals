# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Data..."

#Helper Funcions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'Seed_assets', file_name))
end


#Users
puts "Finding or Creating Users"
User.destroy_all

User.create!([
  {fullname: "User One", phone:"555-555-5555", address: "301 Front St W, Toronto, ON M5V 2T6", email: "user1@email.com", password: "user1", password_confirmation: "user1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {fullname: "User Two", phone:"555-444-6666", address: "6650 Niagara Parkway. Niagara Falls, ON L2G 0L0", email: "user2@email.com", password: "user2", password_confirmation: "user2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {fullname: "User Three", phone:"555-666-4444", address: "1 Austin Terrace, Toronto, ON M5R 1X8", email: "user3@email.com", password: "user3", password_confirmation: "user3", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])


puts "Finding or Creating Categories"

Category.destroy_all

#Categories
cat1 = Category.find_or_create_by! name: 'Electronics'
cat2 = Category.find_or_create_by! name: 'Furniture'
cat3 = Category.find_or_create_by! name: 'Sports Equipment'
cat4 = Category.find_or_create_by! name: 'Tools'



puts "Finding or Creating Products..."


#Products
Product.destroy_all

# NO USERS
5.times do |index|
	cat1.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("e#{index + 1}.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})
end

	cat2.products.create! ({name:"Grey Couch",
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("Couch-table.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})

	cat2.products.create! ({name: "L Couch",
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("lcouch.jpg"),
					price: "5",
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})

	cat2.products.create! ({name: "Black Chair",
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("blackchair.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})

	cat2.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("diningTable.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})




5.times do |index|
	cat3.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("spq#{index + 1}.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})
end

5.times do |index|
	cat4.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset("t#{index + 1}.jpg"),
					price: Faker::Commerce.price,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})
end

# WITH USERS

#USER 1
	cat1.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset('e9.jpg'),
          price: Faker::Commerce.price,
          user_id:1,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})

  cat2.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset('f9.jpg'),
          			price: Faker::Commerce.price,
         		 user_id:1,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})

#USER 2

  cat3.products.create! ({name: Faker::Commerce.product_name,
					description: Faker::Lorem.sentence(50, false, 0),
					image: open_asset('spq9.jpg'),
          price: Faker::Commerce.price,
          user_id:2,
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})


#USER 3

  cat4.products.create! ({name: Faker::Name.name,
          description: Faker::Lorem.sentence(50, false, 0),
          image: open_asset('t9.jpg'),
          price: Faker::Commerce.price,
          user_id:3,
          start_availability: DateTime.new(2018, 4, 13),
          end_availability: DateTime.new(2018, 06, 01)
          })









p "***********************************"
p "Created #{User.count} Users"
p "Created #{Category.count} Categories"
p "Created #{Product.count} products"
# p "Created #{Review.count} products"
p "***********************************"
