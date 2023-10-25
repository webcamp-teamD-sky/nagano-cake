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
   p email: '22@22',
   password: '123456'
)

Customer.create!(
   p last_name: "令和",
   first_name: "道子",
   last_name_kana: "レイワ",
   first_name_kana: "ミチコ",
   phone_number: "0000000000000",
   postcode: "000000000",
   email: "sample@example.com",
   password: "012345",
   address: "東京都渋谷区代々木神園町0-0"
)

Customer.create!(
   p last_name: "ちーむ",
   first_name: "D_sky",
   last_name_kana: "チーム",
   first_name_kana: "ディースカイ",
   phone_number: "0000000000000",
   postcode: "000000000",
   email: "test@test.com",
   password: "123456",
   address: "東京都渋谷区代々木神園町0-0"
)

Customer.create!(
   p last_name: "11",
   first_name: "11",
   last_name_kana: "トステ",
   first_name_kana: "テスト",
   phone_number: "00000000000",
   postcode: "0000000",
   email: "11@11",
   password: "123456",
   address: "11"
)

10.times do |n|
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
      address: "TEST#{n + 1}"
    )
 end

Genre.create!(
   p name: "test"
)

Genre.create!(
   p name: "ケーキtest"
)

Genre.create!(
   p name: "プリンtest"
)

Genre.create!(
   p name: "焼き菓子test"
)

Genre.create!(
   p name: "キャンディtest"
)

Item.create!(
   p name: "test",
   explanation: "test",
   price: "1",
   genre: Genre.find_by(name: "test"),
   is_active: true
)