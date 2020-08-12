# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new( { name: "admin", email: "admin@gmail.com", password: "admin123", password_confirmation: "admin123", admin: true } ).save
User.new( { name: "user", email: "user@gmail.com", password: "user123", password_confirmation: "user123"} ).save

Category.create(name: "barbecues")
Category.create(name: "cafes")
Category.create(name: "multi cuisine")

Restaurant.create(name: "Arsalan", email: "arsalan@gmail.com", address: "salt lake, kolkata, west bengal", phone_no: "9852111111", table_price: 560, category_id: Category.first.id, image: File.open(File.join(Rails.root, "app/assets/images/arsalan2.jpg")) )
Restaurant.create(name: "Haldiram", email: "haldiram@gmail.com", address: "gandhi maidan, patna, bihar", phone_no: "9852123456", table_price: 600, category_id: Category.second.id, image: File.open(File.join(Rails.root, "app/assets/images/haldiram.jpg")) )

FoodItem.create(name:"Burger", price: 59, restaurant: Restaurant.first)
FoodItem.create(name:"Pasta", price: 59, restaurant: Restaurant.second)

