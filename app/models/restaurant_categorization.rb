# frozen_string_literal: true

class RestaurantCategorization < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
  validates :restaurant_id, presence: true
  validates :category_id, presence: true
end
