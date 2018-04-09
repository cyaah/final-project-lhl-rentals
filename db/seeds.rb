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


puts "Finding or Creating Categories"

#Categories
cat1 = Category.find_or_create_by! name: 'Tools'
cat2 = Category.find_or_create_by! name: 'Sports Equipment'
cat3 = Category.find_or_create_by! name: 'Electronics'



puts "Finding or Creating Products..."


#Products
Product.destroy_all

5.times do |index|
	cat1.products.create! ({name: Faker::Name.name,
					description: Faker::Lorem.sentence(20, false, 0),
					image: open_asset('bosch.jpg'),
					price: 30,

					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})
end

	cat2.products.create! ({name: Faker::Name.name,
					description: Faker::Lorem.sentence(20, false, 0),
					image: open_asset('apparel5.jpg'),
					price: 30,

					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})


p "Created #{Product.count} products"
