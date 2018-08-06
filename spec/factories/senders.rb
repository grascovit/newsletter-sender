# frozen_string_literal: true

FactoryBot.define do
  factory :sender do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    user
  end
end
