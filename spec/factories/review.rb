# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    restaurant
    rating { rand(1..5) }
    sequence(:body) { |n| "Oh, such a nice place #{n}" }
  end
end
