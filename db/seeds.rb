# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Start seeding"

puts "1. Seeding users..."
alex = User.create!(
    username: "alex",
    email: "alex@email.com",
    password: "1234"
)

maryane = User.create!(
    username: "maryanne",
    email: "maryanne@email.com",
    password: "1234"
)

puts "2. Seeding sellers..."
alex_seller = Seller.create!(
    username: "alex",
    email: "alex@email.com",
    password: "1234"
)

maryane_seller = Seller.create!(
    username: "maryanne",
    email: "maryanne@email.com",
    password: "1234"
)

puts "3. Seeding houses..."
30.times do
    House.create!(
        name: Faker::Lorem.sentence(word_count: rand(1..5)),
        description: Faker::Lorem.sentence(word_count: rand(3..15)),
        location: Faker::Address.city,
        price: (rand()*1000000).round(2),
        bedrooms: rand(1..10),
        size_in_sqft:  (rand()*rand(1000..100000)).round(2),
        seller_id: [alex_seller, maryane_seller].sample.id
    )
end

puts "Done seeding"