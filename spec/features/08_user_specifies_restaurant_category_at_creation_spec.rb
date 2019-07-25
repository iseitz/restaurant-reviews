# frozen_string_literal: true

require 'rails_helper'

# As a user
# I want to specify what categories a restaurant belongs to when creating it
# So people know what kind of cuisine the new restaurant serves

# On the page to create a new restaurant, I should see checkboxes for all the categories.
# Upon successful form submission, I should see the names of the categories which were selected on the form to be present on the restaurant's details page.

feature 'visitors can add restaurants category when creating new restaurant' do
  scenario 'visitor adds new restaurant with one category successfully' do
    CategorySeeder.seed!
    visit new_restaurant_path

    expect(page).to have_content 'New Restaurant Form'

    fill_in 'restaurant[name]', with: 'Di Bruno Bros'
    fill_in 'restaurant[address]', with: '930 S 9th St'
    fill_in 'restaurant[city]', with: 'Philadel'
    fill_in 'restaurant[state]', with: 'Pennsylvania'
    fill_in 'restaurant[zip]', with: '19147'
    fill_in 'restaurant[description]', with: 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'

    page.check('Japanese', allow_label_click: true)

    click_button 'Add Restaurant'

    expect(page).to have_content 'Restaurant added successfully'
    expect(page).to have_content 'Di Bruno Bros'
    expect(page).to have_content 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'
    expect(page).to have_content 'Categories:'
    expect(page).to have_content 'Japanese'
  end

  scenario 'visitor adds new restaurant with two categories successfully' do
    CategorySeeder.seed!
    visit new_restaurant_path

    fill_in 'restaurant[name]', with: 'Di Bruno Bros'
    fill_in 'restaurant[address]', with: '930 S 9th St'
    fill_in 'restaurant[city]', with: 'Philadel'
    fill_in 'restaurant[state]', with: 'Pennsylvania'
    fill_in 'restaurant[zip]', with: '19147'
    fill_in 'restaurant[description]', with: 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'

    page.check('Japanese', allow_label_click: true)
    page.check('European', allow_label_click: true)

    click_button 'Add Restaurant'
    expect(page).to have_content 'Restaurant added successfully'
    expect(page).to have_content 'Di Bruno Bros'
    expect(page).to have_content 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'
    expect(page).to have_content 'Categories:'
    expect(page).to have_content 'Japanese'
    expect(page).to have_content 'European'
  end
end
