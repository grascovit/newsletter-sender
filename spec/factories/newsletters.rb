# frozen_string_literal: true

FactoryBot.define do
  factory :newsletter do
    title { Faker::Hipster.word }
    body { Faker::Lorem.paragraph }
    sent_at { 1.day.ago }
    list { build(:recipient_list) }
    sender
    template
  end
end
