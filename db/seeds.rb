# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def generate_code(number)
  charset = Array('A'..'Z') + Array('a'..'z')
  Array.new(number) { charset.sample }.join
end

100.times do |_i|
  Product.create(title: generate_code(6), description: generate_code(20), price: rand(500..700),capacity: rand(100..300))
end
