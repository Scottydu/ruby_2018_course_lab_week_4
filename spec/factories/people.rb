FactoryBot.define do
  factory :person do
    name { Faker::Name.unique.name }
    image_url { Faker::Avatar.image }
    country_code { Country.all_codes.sample }
  end
end
