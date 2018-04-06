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

puts "Finding or Creating Products..."


#Products
Product.destroy_all

20.times do |index| 
	Product.create! ({name: Faker::Name.name,
					description: Faker::Lorem.sentence(20, false, 0),
					image: open_asset('apparel5.jpg'),
					price: 30,
					category: 'Clothing',
					start_availability: DateTime.new(2018, 4, 13),
					end_availability: DateTime.new(2018, 06, 01)
					})
end

p "Created #{Product.count} products"
	
