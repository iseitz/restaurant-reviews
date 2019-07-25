# frozen_string_literal: true

class CreateRestaurantCategorizations < ActiveRecord::Migration[5.2]
  # def change
  #   create_join_table :restaurants, :categories do |t|
  #     # t.index %i[restaurant_id category_id]
  #     # t.index %i[category_id restaurant_id]
  #     t.timestamps
  #   end
  def change
    create_table :restaurant_categorizations do |t|
      t.integer :restaurant_id, null: false, index: true
      t.integer :category_id, null: false, index: true

      t.timestamps
    end
  end
end
