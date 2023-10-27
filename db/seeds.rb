# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   p email: 'huwahuwacake@cake',
   password: 'cakehuwa'
)

Admin.create!(
   p email: '11@11',
   password: '123456'
)

Admin.create!(
   p email: '22@22',
   password: '123456'
)

Admin.create!(
   p email: '33@33',
   password: '123456'
)

Customer.create!(
   p last_name: "00",
   first_name: "00",
   last_name_kana: "トステ",
   first_name_kana: "テスト",
   phone_number: "00000000000",
   postcode: "0000000",
   email: "00@00",
   password: "123456",
   address: "00"
)

Customer.create!(
   p last_name: "令和",
   first_name: "道子",
   last_name_kana: "レイワ",
   first_name_kana: "ミチコ",
   phone_number: "0000000000000",
   postcode: "000000000",
   email: "sample@example.com",
   password: "123456",
   address: "東京都渋谷区代々木神園町0-0"
)

Customer.create!(
   p last_name: "印負羅",
   first_name: "徳富",
   last_name_kana: "インフラ",
   first_name_kana: "トップ",
   phone_number: "0368694700",
   postcode: "1060032",
   email: "test@test.com",
   password: "123456",
   address: "東京都港区六本木３丁目２−１ 住友不動産六本木グランドタワー 23F"
)

8.times do |n|
   p n
    p Customer.create!(
      last_name: Faker::Japanese::Name.last_name,
      first_name: Faker::Japanese::Name.first_name,
      last_name_kana: "トステ",
      first_name_kana: "テスト",
      phone_number: "0123456789#{n + 1}",
      postcode: "1234567",
      email: "test#{n + 1}@test.com",
      password: "123456",
      address: "TEST県TEST市TEST町#{n + 1}-#{n + 1}"
    )
 end

registered_address_maximum = 10

Customer.all.count.times do |i|
 p i += 1
 rand(1..registered_address_maximum).times do |j|
    j += 1
    Address.create!(
      customer_id: i,
      name: "株式会社aaa  #{i}-#{j}",
      address: "aaa県aaa町aaa村 #{i}-#{j}",
      postcode: "1234567"
    )
 end
end

Genre.create!(
   p name: "ケーキ"
)

Genre.create!(
   p name: "プリン"
)

Genre.create!(
   p name: "焼き菓子"
)

Genre.create!(
   p name: "キャンディ"
)

Item.create!(
   p name: "マドレーヌ",
   explanation: "しっとりとした美味しいマドレーヌです。",
   price: "210",
   genre: Genre.find_by(name: "焼き菓子"),
   is_active: true
)
item = Item.find_by(name: "マドレーヌ")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/madore-nu.jpg')), filename: 'madore-nu.jpg')

Item.create!(
   p name: "フィナンシェ",
   explanation: "バターをたっぷり使ったフィナンシェです。",
   price: "240",
   genre: Genre.find_by(name: "焼き菓子"),
   is_active: true
)
item = Item.find_by(name: "フィナンシェ")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/finanshe.jpg')), filename: 'finanshe.jpg')

Item.create!(
   p name: "クッキー",
   explanation: "一般的なアイスボックスクッキーです。",
   price: "180",
   genre: Genre.find_by(name: "焼き菓子"),
   is_active: true
)
item = Item.find_by(name: "クッキー")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/kukki-.jpg')), filename: 'kukki-.jpg')


Item.create!(
   p name: "かぼちゃプリン",
   explanation: "あまくてほっこりするプリンです。",
   price: "580",
   genre: Genre.find_by(name: "プリン"),
   is_active: true
)
item = Item.find_by(name: "かぼちゃプリン")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/kabotyapurin.jpg')), filename: 'kabotyapurin.jpg')

Item.create!(
   p name: "プリンアラモード",
   explanation: "昔ながらのプリンアラモードです。",
   price: "840",
   genre: Genre.find_by(name: "プリン"),
   is_active: true
)
item = Item.find_by(name: "プリンアラモード")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/purinaramo-do.jpg')), filename: 'purinaramo-do.jpg')

Item.create!(
   p name: "フルーツタルト",
   explanation: "季節のフルーツをふんだんに使用した贅沢なフルーツタルトです。生ものにつきお早めにお召し上がりください。",
   price: "2400",
   genre: Genre.find_by(name: "ケーキ"),
   is_active: true
)
item = Item.find_by(name: "フルーツタルト")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/huru-tutaruto.jpg')), filename: 'huru-tutaruto.jpg')


Item.create!(
   p name: "チョコレートケーキ",
   explanation: "クーベルチュールチョコレートを使用しました。ベルギーから取り寄せています。一番人気の商品ですので濃厚な味をぜひこの機会にご賞味ください。",
   price: "640",
   genre: Genre.find_by(name: "ケーキ"),
   is_active: true
)
item = Item.find_by(name: "チョコレートケーキ")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/tyokore-toke-ki.jpg')), filename: 'tyokore-toke-ki.jpg')

Item.create!(
   p name: "千歳飴",
   explanation: "七五三の時期にピッタリ！子供が大好きな千歳飴です。",
   price: "105",
   genre: Genre.find_by(name: "キャンディ"),
   is_active: true
)
item = Item.find_by(name: "千歳飴")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/titoseame.jpg')), filename: 'titoseame.jpg')