# frozen_string_literal: true

require 'rails_helper'

feature 'visitor sees a list of all categories of restaurants' do
  scenario 'visitor clicks on the Categories link in the header of any page', %(
    As a user
    I want to see categories of restaurants e.g. thai italian chinese
    So that I can see the different kinds of foods I could eat
    I should see the name of all categories.
    I should get to this page by clicking on a "Categories" link which is located on the header of every page.
    ) do
    resto1 = FactoryBot.create(:restaurant)
    resto2 = FactoryBot.create(:restaurant)
    category1 = FactoryBot.create(:category, name: 'Japanese')
    category2 = FactoryBot.create(:category, name: 'Russian')
    restaurant_categorization1 = RestaurantCategorization.create!(restaurant: resto1, category: category2)
    restaurant_categorization2 = RestaurantCategorization.create!(restaurant: resto2, category: category1)

    visit root_path

    expect(page).to have_content 'Categories'
    expect(page).to have_link 'Categories'

    click_link resto1.name.to_s

    expect(page).to have_link 'Categories'

    click_link 'Categories'

    expect(page).to have_content category1.name.to_s
    expect(page).to have_content category2.name.to_s
    expect(page).to have_content 'All Restaurant Categories'
  end
end
