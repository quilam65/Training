# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all
Category.create!(title: "Ruby")
Product.create!(title: "Ruby Book", description: 'Learn Ruby programing', price: 12.99, published: true )
Product.create!(title: "Ruby Book 2", description: 'Learn Ruby programing 2', price: 12.99, published: true)
Product.create!(title: "Ruby Book 3", description: 'Learn Ruby programing 3', price: 12.99, published: true)
