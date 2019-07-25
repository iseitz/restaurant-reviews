# frozen_string_literal: true

CATEGORIES =
  [
    'Italian',
    'Fast food',
    'Kazakh',
    'Chinese',
    'Mediterranean',
    'Uzbek'
  ].freeze

CATEGORIES.each do |name|
  Category.find_or_create_by!(name: name)
end
