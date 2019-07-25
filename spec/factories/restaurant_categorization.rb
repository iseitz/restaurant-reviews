# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant_categorization do
    restaurant
    category
  end
end
