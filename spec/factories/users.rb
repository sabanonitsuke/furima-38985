FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6, special_characters: false)}
    password_confirmation {password}
    nickname {Faker::Restaurant.name}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_date {Faker::Date.birthday}
  end
end