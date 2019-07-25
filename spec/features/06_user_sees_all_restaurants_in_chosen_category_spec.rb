# frozen_string_literal: true

require 'rails_helper'

# As a user
# I want to see the restaurants belonging to a category
# So that I can pick a restaurant for a specific category

# [] I should see the name of the category at the top of the page.
# [] I should see the name of all restaurants that belong to this category.
# [] I should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
# [] I should get to this page by clicking on the name of a category while on the page with the names of all the categories.

feature 'visitor sees all restarants belonging to a particular category' do
  scenario 'visitor clicks on the  name of the Category and sees  a list of all the restaurants belonging to this category' do
    resto1 = Restaurant.create!(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '12111')
    resto2 = Restaurant.create!(name: 'Rock Bottom', address: 'Beach street', city: 'Boston', state: 'MA', zip: '12112')
    resto3 = Restaurant.create!(name: 'Yumm', address: 'Birch street', city: 'Almaty', state: 'MA', zip: '12112')
    category1 = Category.create!(name: 'European')
    category2 = Category.create!(name: 'Russian')
    restaurant_categorization1 = RestaurantCategorization.create!(restaurant_id: resto1.id, category_id: category2.id)
    restaurant_categorization2 = RestaurantCategorization.create!(restaurant_id: resto2.id, category_id: category1.id)
    restaurant_categorization3 = RestaurantCategorization.create!(restaurant_id: resto3.id, category_id: category1.id)
    visit root_path
    click_link 'Categories'
    click_link category1.name.to_s

    expect(page).to have_content 'European style food'
    expect(page).to have_content resto2.name.to_s
    expect(page).to have_content resto3.name.to_s
  end
end
