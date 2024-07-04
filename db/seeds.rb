# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

choices = ["chinese", "italian", "japanese", "french", "belgian"]
# choices.sample

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

10.times do
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    # rating:  rand(0..5),
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: choices.sample
  )
  restaurant.save!
    puts "Created #{restaurant.name}"
end

puts "Finished!"

# REMINDER: Run rails db:seed to launch the seeding script. ON THUR
