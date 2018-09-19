FactoryBot.define do
  factory :movie do
    name { "Movie number #{Movie.count}" }
    year { (1910..2018).to_a.sample }
  end
end
