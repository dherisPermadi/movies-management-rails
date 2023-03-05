require 'faker'

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    rating { rand(0.0..10.0).round(2) }
  end
end
