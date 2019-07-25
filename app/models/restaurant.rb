# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :restaurant_categorizations
  has_many :categories, through: :restaurant_categorizations
  validates :name, presence: :true
  validates :address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true, length: { minimum: 2 }
  validates :zip, presence: :true, length: { minimum: 5 }
  accepts_nested_attributes_for :categories
  # attr_accessible :category_ids
end
