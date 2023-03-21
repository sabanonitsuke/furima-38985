FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    nickname { Faker::Restaurant.name }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.birthday }
  end
end
