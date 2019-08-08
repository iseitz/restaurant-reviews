# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    CATEGORIES = ['European', 'Italian', 'Fast food', 'Russian', 'Kazakh', 'Chinese', 'Mediterranean', 'Uzbek', 'Japanese'].freeze
    sequence(:name) { CATEGORIES[rand(CATEGORIES.length)] }
  end
end
