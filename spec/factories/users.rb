FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(10, 16) }
  end
end
