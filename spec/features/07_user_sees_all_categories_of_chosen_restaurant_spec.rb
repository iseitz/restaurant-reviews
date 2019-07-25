# frozen_string_literal: true

require 'rails_helper'

# As a user
# I want to see the categories that a restaurant belongs to
# So that I know the different kinds of cuisine that the restaurant serves

# [] On the page for a restaurant's details, I should see all the categories that a restaurant belongs to.
# [] Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.

feature 'visitor sees all categories that the restaurant belongs to' do
  scenario 'visitor clicks on the name of a restaurant and sees all the categories that this restaurant belongs to' do
    resto1 = Restaurant.create!(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '12111')
    resto2 = Restaurant.create!(name: 'Rock Bottom', address: 'Beach street', city: 'Boston', state: 'MA', zip: '12112')
    resto3 = Restaurant.create!(name: 'Yumm', address: 'Birch street', city: 'Almaty', state: 'MA', zip: '12112')
    category1 = Category.create!(name: 'European')
    category2 = Category.create!(name: 'Russian')
    restaurant_categorization1 = RestaurantCategorization.create!(restaurant_id: resto1.id, category_id: category2.id)
    restaurant_categorization2 = RestaurantCategorization.create!(restaurant_id: resto1.id, category_id: category1.id)
    restaurant_categorization3 = RestaurantCategorization.create!(restaurant_id: resto3.id, category_id: category1.id)
    visit root_path
    click_link resto1.name.to_s

    expect(page).to have_content resto1.name.to_s
    expect(page).to have_content category1.name.to_s
    expect(page).to have_content category2.name.to_s
    expect(page).to have_content 'Categories:'
  end
end
