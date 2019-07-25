# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    sequence(:address) { |n| "Street#{n}, house#{n}" }
    sequence(:city) { |n| "City#{n}" }
    sequence(:state) { |n| "State#{n}" }
    sequence(:zip) { |n| "1#{n}2#{n}" }
    description 'Oh so delicious'
  end
end
