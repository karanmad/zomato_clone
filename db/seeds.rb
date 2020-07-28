# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new( { Username: "admin", email: "admin@gmail.com", password: "admin123", password_confirmation: "admin123", admin: true } ).save
User.new( { Username: "user", email: "user@gmail.com", password: "user123", password_confirmation: "user123"} ).save

RestaurantCategory.create(name: "barbecues")
RestaurantCategory.create(name: "cafes")
RestaurantCategory.create(name: "multi cuisine")

