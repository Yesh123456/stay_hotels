# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Property.find_or_create_by!(name: 'Taj Hotels',
	long_title: 'Taj Hotels is the best',
	description: 'Taj Hotels is the best',
	address_line_1: 'Florida Road',
	address_line_2: 'New Jersey Lane',
	city: 'New York',
	state: 'New York',
	country: 'United States')
