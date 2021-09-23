FactoryBot.define do
  factory :user do
    full_name { Faker::Name.first_name }
    username { Faker::Internet.username(specifier: full_name) }
    email { "#{username}@nw.co" }
    password { '123456789' }
  end
end
