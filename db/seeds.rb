# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Item.create(name: 'Awesome Item No. 1!', price: 19_99)
# Item.create(name: 'Even More Awesome Item No. 2!', price: 39_99)
User.create(email: 'admin@test.com', password: 'password', password_confirmation: 'password', user_type: "admin user")
