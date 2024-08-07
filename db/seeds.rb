# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning the DB..."
Restaurant.destroy_all

puts "Creating Restaurants..."

5.times do
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: restaurant_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.unique.street_address,
    category: Restaurant::CATEGORY.sample
  )
end

puts "...created #{Restaurant.count} restaurants."
