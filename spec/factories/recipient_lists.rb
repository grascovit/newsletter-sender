# frozen_string_literal: true

FactoryBot.define do
  factory :recipient_list do
    name { Faker::Hipster.word }
    user
  end
end
