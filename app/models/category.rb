# frozen_string_literal: true

class Category < ApplicationRecord
  CATEGORIES = ['European', 'Italian', 'Fast food', 'Russian', 'Kazakh', 'Chinese', 'Mediterranean', 'Uzbek', 'Japanese'].freeze
  has_many :restaurant_categorizations
  has_many :restaurants, through: :restaurant_categorizations
  validates :name, presence: true, inclusion: { in: CATEGORIES }, uniqueness: true
end
