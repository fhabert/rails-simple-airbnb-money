# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Creating database"
Order.destroy_all if Rails.env.development?
UserFlat.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts "Setting up emails/passwords"
emails = ["f@gmail.com", "j@gmail.com", "p@gmail.com", "a@gmail.com"]
passwords = ["f12345", "j12345", "p12345", "a12345"]
names = ["felix", "jonas", "pierre", "alex"]

puts "Creating users"
for i in 0..3
  user = User.create!(
      email: emails[i],
      password: passwords[i],
      name: names[i]
  )
end

users = User.all
users_id = users.map { |user| user.id }

puts "Creating Flats"
Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 78H',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price: 75,
  number_of_guests: 3,
  user_id: users_id.sample,
  url: 'https://images.unsplash.com/photo-1571055107559-3e67626fa8be?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80'
)
Flat.create!(
  name: 'Charmful place to stay at in london',
  address: 'Grann Road London W9 1DT',
  description: 'A charming, fully self contained guesthouse, set in a private garden of a 14th century cottage located in the pretty village of Chipstead',
  price: 105,
  number_of_guests: 3,
  user_id: users_id.sample,
  url: 'https://images.unsplash.com/photo-1430285561322-7808604715df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'
)
Flat.create!(
  name: 'Little place of paradise flat london',
  address: '104 Jonathan Gardens London W10 1DT',
  description: 'A perfect country escape with fast access into London and Gatwick Airport a short taxi ride away. ',
  price: 12,
  number_of_guests: 3,
  user_id: users_id.sample,
  url: 'https://images.unsplash.com/photo-1600047509782-20d39509f26d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=904&q=80'
)
Flat.create!(
  name: 'A private country escape with stunning views',
  address: '10 Rail Gardens London W9 3PT',
  description: 'The guesthouse offers views over open countryside, enjoy total peace and quiet, lots of privacy, all in an area of outstanding natural beauty.',
  price: 400,
  number_of_guests: 3,
  user_id: users_id.sample,
  url: 'https://images.unsplash.com/photo-1595185584650-3d86a419dc93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1189&q=80'
)
puts "Finish seed"