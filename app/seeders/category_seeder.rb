# frozen_string_literal: true

class CategorySeeder
  CATEGORIES =
    [
      'European',
      'Italian',
      'Fast food',
      'Russian',
      'Kazakh',
      'Chinese',
      'Mediterranean',
      'Uzbek',
      'Japanese'
    ].freeze

  def self.seed!
    CATEGORIES.each do |name|
      obj = Category.find_or_initialize_by(name: name)
      obj.save!
    end
  end
end
