# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all
5.times do |i|
  Category.create!(title: "Category #{i+1}")
  Product.create!(title: "Product #{i+1}", description: 'Learn Ruby programing', price: 12.99, published: true )
end
