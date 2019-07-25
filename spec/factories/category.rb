# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    CATEGORIES = ['European', 'Italian', 'Fast food', 'Russian', 'Kazakh', 'Chinese', 'Mediterranean', 'Uzbek', 'Japanese'].freeze
    sequence(:name, 10) { |n| "CATEGORIES[#{n - 1}]" }
  end
end
