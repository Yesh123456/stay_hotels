# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

user =  User.create!(
	email: "test1@gmail.com",
	password: "password12345"
)

6.times do |i|
  props = Property.create!(
    name: Faker::Company.unique.name,
    description: Faker::Lorem.sentence(word_count: 30),
    address_line_1: Faker::Address.street_address,
    address_line_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(Faker::Number.between(from: 50.0, to: 100.0), 'USD'),
  )
  props.images.attach(io: File.open(Rails.root.join("db/images/property_#{i}.jpg")), filename: props.name.to_s)
  props.images.attach(io: File.open(Rails.root.join("db/images/property_#{i+6}.jpg")), filename: props.name.to_s)

  ((6..10).to_a.sample).times do
  	Review.create!(
	  	content: Faker::Lorem.sentence(word_count: 20),
			location_rating: rand(5..10),
			service_rating: rand(5..10),
			room_comfort_quality_rating: rand(5..10),
			cleanliness_rating: rand(5..10),
			facilities_rating: rand(5..10),
			value_for_money_rating: rand(5..10),
	  	property: props,
	  	user: user
  	)
  end

  check_in = Faker::Date.forward(days: rand(1..30))
  check_out = check_in + rand(2..7).days
  reservation = Reservation.create!(
    user: user,
    property: props,
    check_in_date: check_in,
    check_out_date: check_out
  )
  puts "✅ Reservation and favorites created for #{props.name} from #{check_in} to #{check_out} by #{user.email}"
end
