# frozen_string_literal: true

FactoryBot.define do
  factory :template do
    name { Faker::Hipster.word }
    body { Faker::Lorem.paragraph }
    user
  end
end
