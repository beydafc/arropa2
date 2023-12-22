require "open-uri"
Item.delete_all
User.delete_all
Movement.delete_all

GENRE = %w(men women)
SIZE = %w(s m l xl)
KIND = %w(top bottom shoes)

usuario = User.create(email: "camilo@hotmail.com", password: "1234567", first_name: "Camilo", last_name: "Fentanes", phone_number: "442 506 6096", address: "Milenio III, Queretaro, Mexico")

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

Movement.create(purchase_date: Date.today, user_id: 1, item_id: 3)
Movement.create(purchase_date: Date.today, user_id: 1, item_id: 5)
Movement.create(purchase_date: Date.today, user_id: 2, item_id: 7)
Movement.create(purchase_date: Date.today, user_id: 2, item_id: 1)
