# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Item.delete_all
User.delete_all

GENRE = %w(men women)
SIZE = %w(s m l xl)
KIND = %w(top bottom shoes)
usuario = User.create(email: "beyda@hotmail.com", password: "1234567", first_name: "Beyda", last_name: "Fentanes", phone_number: "442 506 6096", address: "Milenio III, Queretaro, Mexico")

10.times do
  item = Item.new(
    name: Faker::FunnyName.two_word_name,
    price: rand(3.0..50.0),
    genre: GENRE.sample,
    size: SIZE.sample,
    color: Faker::Color.color_name,
    kind: KIND.sample,
    user_id: usuario.id
  )
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  item.save!
end
