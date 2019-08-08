# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    sequence(:address) { |n| "Street#{n}, house#{n}" }
    sequence(:city) { |n| "City#{n}" }
    sequence(:state) { |n| "State#{n}" }
    sequence(:zip) { |n| "1#{n}2#{n}3" }
    sequence(:description) { 'Oh so delicious #{n}' }
    factory :restaurant_with_reviews do
      transient do
        reviews_count { 5 }
      end

      after(:create) do |restaurant, evaluator|
        create_list(:review, evaluator.reviews_count, restaurant: restaurant)
      end
    end
  end
end
