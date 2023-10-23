# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'huwahuwacake@cake',
   password: 'cakehuwa'
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

Customer.create!(
   last_name: "トステ",
   first_name: "テスト",
   last_name_kana: "とすて",
   first_name_kana: "てすと",
   phone_number: "01234567890",
   postcode: "1234567",
   email: "test@test.com",
   encrypted_password: "123456",
   address: "TEST"
)
