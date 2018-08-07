# frozen_string_literal: true

FactoryBot.define do
  factory :recipient do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    list { build(:recipient_list) }
  end
end
