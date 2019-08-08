# frozen_string_literal: true

require 'rails_helper'

feature 'visitor sees a list of restaurants' do
  scenario 'sees a list of restaurants and link for new restaurant', %(
    Visiting the `/restaurants` path should contain a list of restaurants.
    ) do
    dumpling_king = FactoryBot.create(:restaurant, name: 'Dumpling King')
    rock_bottom = FactoryBot.create(:restaurant, name: 'Rock Bottom')

    visit restaurants_path

    expect(page).to have_content 'Rock Bottom'
    expect(page).to have_link 'Dumpling King'

    click_link 'Add New Restaurant'

    expect(page).to have_content 'New Restaurant Form'
  end
  scenario 'clicks link and is taken to show page for given restaurant', %(
    Visiting the root path should display a list of all restaurants.
    Visiting the `/restaurants/:id` path should show the restaurant details for a restaurant with the chosen :id.
    ) do
    resto1 = FactoryBot.create(:restaurant)
    resto2 = FactoryBot.create(:restaurant)
    resto3 = FactoryBot.create(:restaurant)
    resto4 = FactoryBot.create(:restaurant)
    resto5 = FactoryBot.create(:restaurant)
    dumpling_king = Restaurant.create!(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '12111', description: 'Straightforward dumplings for a great price.')
    id = dumpling_king.id
    path = "/restaurants/#{id}"

    visit root_path

    click_link 'Dumpling King'

    expect(page).to have_content dumpling_king.name
    expect(page).to have_content dumpling_king.address
    expect(page).to have_content dumpling_king.city
    expect(page).to have_content dumpling_king.state
    expect(page).to have_content dumpling_king.zip
    expect(page).to have_content dumpling_king.description
    assert_equal path, current_path
  end
end
