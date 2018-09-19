people = (1..30).to_a.map do
  FactoryBot.create(:person)
end

20.times do
  movie = FactoryBot.create(:movie)
  people.sample(7).each { |person| FactoryBot.create(:participation, movie: movie, person: person) }
end

10.times { FactoryBot.create(:user, password: '123123') }
