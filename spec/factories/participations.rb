FactoryBot.define do
  factory :participation do
    movie
    person

    role do |participation|
      if participation.movie.participations.empty?
        'director'
      else
        'actor'
      end
    end
  end
end
