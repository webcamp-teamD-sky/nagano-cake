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
   last_name_kana: "11",
   first_name_kana: "11",
   phone_number: "00000000000",
   postcode: "0000000",
   email: "11@11",
   password: "123456",
   address: "11"
)

#  10.times do |n|
#     Customer.create!(
#       last_name: "トステ#{n + 1}",
#       first_name: "テスト#{n + 1}",
#       last_name_kana: "とすて#{n + 1}",
#       first_name_kana: "てすと#{n + 1}",
#       phone_number: "01234567890",
#       postcode: "1234567",
#       email: "test#{n + 1}@test.com",
#       encrypted_password: "123456",
#       address: "TEST#{n + 1}"
#     )
#  end

# 10.times do
#  Customer.create!(
#    last_name: "姓",
#    first_name: "名",
#    last_name_kana: "セイ",
#    first_name_kana: "メイ",
#    phone_number: "01234567890",
#    postcode: "1234567",
#    p email: "test-#{n+1}@test.com",
#    # email: Faker::Internet.unique.email, # もしFaker gemを使用してランダムなメールアドレスを生成する場合
#    password = "123456#{n+1}"
#    # encrypted_password: "password123", # パスワードはハッシュ化されている必要があります
#    address: "東京都渋谷区ああああああああああああああああああああ",
#    )
# end

# 10.times do |n|
#     Customer.create!(
#       p last_name: "トステ#{n + 1}",
#       first_name: "テスト#{n + 1}",
#       last_name_kana: "とすて#{n + 1}",
#       first_name_kana: "てすと#{n + 1}",
#       phone_number: "01234567890",
#       postcode: "1234567",
#       email: "test#{n + 1}@test.com",
#       password: Faker::Internet.unique.email,
#       address: "TEST#{n + 1}"
#     )
#  end