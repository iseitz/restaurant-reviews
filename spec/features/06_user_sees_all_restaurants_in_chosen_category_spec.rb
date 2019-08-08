# frozen_string_literal: true

require 'rails_helper'

feature 'visitor sees all restarants belonging to a particular category' do
  scenario 'visitor clicks on the  name of the Category and sees a list of all the restaurants belonging to this category', %(
    As a user
    I want to see the restaurants belonging to a category
    So that I can pick a restaurant for a specific category
    I should see the name of the category at the top of the page.
    I should see the name of all restaurants that belong to this category.
    I should get to this page by clicking on the name of a category while on the page with the names of all the categories.
    ) do
    resto1 = FactoryBot.create(:restaurant)
    resto2 = FactoryBot.create(:restaurant)
    resto3 = FactoryBot.create(:restaurant)
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
  scenario 'visitor sees all restaurant details when clicks on the name of the restaurent of their choice on the list of all restaurants in chosen category', %(
    I should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
  ) do
    resto1 = FactoryBot.create(:restaurant)
    resto2 = FactoryBot.create(:restaurant)
    resto3 = FactoryBot.create(:restaurant)
    category1 = Category.create!(name: 'European')
    category2 = Category.create!(name: 'Russian')
    restaurant_categorization1 = RestaurantCategorization.create!(restaurant_id: resto1.id, category_id: category2.id)
    restaurant_categorization2 = RestaurantCategorization.create!(restaurant_id: resto2.id, category_id: category1.id)
    restaurant_categorization3 = RestaurantCategorization.create!(restaurant_id: resto3.id, category_id: category1.id)

    visit root_path
    click_link 'Categories'
    click_link category1.name.to_s
    click_link resto2.name.to_s

    expect(page).to have_content resto2.name.to_s
    expect(page).to have_content resto2.address.to_s
    expect(page).to have_content resto2.city.to_s
    expect(page).to have_content 'European'
  end
end
