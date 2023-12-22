require "open-uri"
Item.delete_all
User.delete_all
Movement.delete_all

GENRE = %w(men women)
SIZE = %w(s m l xl)
KIND = %w(top bottom shoes)
IMG = %w(https://i5.walmartimages.com/asr/8e69565b-f650-4557-aaab-4474b7fa1628.affb7d833f50175d3298807ee2424554.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF https://i.pinimg.com/originals/8e/e8/01/8ee8015a522031aee7f1c2edea7c2a50.jpg https://imagescdn.thecollective.in/img/app/product/6/693610-7403708.jpg https://images.bewakoof.com/uploads/grid/app/casual-outfits-for-men-bewakoof-blog-12-1615892382.jpg https://i1.wp.com/stylegirlfriend.com/wp-content/uploads/2020/01/20-justus-frederic-hansen.jpg?fit=819%2C1024&ssl=1 https://miro.medium.com/v2/resize:fit:736/1*JL4oSMOp2fim6UFTGW-zEw.jpeg https://www.herstylecode.com/wp-content/uploads/2022/11/Trench-Coat-outfit-ideas-for-women-45.jpg https://cdn.luxe.digital/media/2019/11/20125619/trendy-work-outfit-women-business-casual-style-luxe-digital.jpg https://comfyfootgear.com/cdn/shop/products/orthopedic-walking-shoes-platform-sneakers-for-women-683275.jpg?v=1603243946 https://rukminim2.flixcart.com/image/850/1000/xif0q/shoe/c/7/n/4-608-4-kliev-paris-black-original-imagsek8ymzadzzs.jpeg?q=90 https://www.bobbies.com/c/21810155-large_portrait/women-flat-boots.jpg https://come4buy.com/cdn/shop/products/sports-shoes-men-comtable-sneakers-230828002001.jpg?v=1693205391 https://thursdayboots.com/cdn/shop/files/1024x1024-Men-Renegade-TanMatte-022323-2.jpg?v=1684176386)

IMG2 = %w(https://s3.us-east-1.amazonaws.com/images.gearjunkie.com/uploads/2023/08/ATP03502-3-e1692733928952.jpg)

User.create(email: "beyda@hotmail.com", password: "1234567", first_name: "Beyda", last_name: "Fentanes", phone_number: "442 506 6096", address: "Milenio III, Queretaro, Mexico")

usuario = User.create(email: "camilo@hotmail.com", password: "1234567", first_name: "Camilo", last_name: "Fentanes", phone_number: "442 506 6096", address: "Milenio III, Queretaro, Mexico")

25.times do
  item = Item.new(
    name: Faker::FunnyName.two_word_name,
    price: rand(3.0..50.0),
    genre: GENRE.sample,
    size: SIZE.sample,
    color: Faker::Color.color_name,
    kind: KIND.sample,
    user_id: usuario.id
  )
  if item.kind == "shoes"
  file = URI.open(IMG.sample)
  item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  item.save!
  else
  file = URI.open(IMG2.sample)
  item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  item.save!
  end
end

Movement.create(purchase_date: Date.today, user_id: 1, item_id: 3)
Movement.create(purchase_date: Date.today, user_id: 1, item_id: 5)
Movement.create(purchase_date: Date.today, user_id: 2, item_id: 7)
Movement.create(purchase_date: Date.today, user_id: 2, item_id: 1)
