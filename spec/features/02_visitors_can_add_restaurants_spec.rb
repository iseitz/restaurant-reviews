# frozen_string_literal: true

require 'rails_helper'

# SIDE NOTE TO THE TEACHER!!!
# I HAVE REPLACED  fill_in "Name", fill_in "Address" and other similar fields with fill_in 'restaurant[name]', fill_in 'resturant[address]'
# because my form is nested and the fields "Name", "Address" etc are seen as inactive by Rails

feature 'visitors can add restaurants' do
  scenario 'visitor adds new restaurant successfully', %(
    A restaurant must have a name, address, city, state, and zip code. It can optionally have a description.
    Visiting the `/restaurants/new` path should display a form for creating a new restaurant.
    When adding a new restaurant, if I fill out the form correctly, I should see the page for the newly created restaurant.
    ) do
    visit new_restaurant_path
    expect(page).to have_content 'New Restaurant Form'

    fill_in 'restaurant[name]', with: 'Di Bruno Bros'
    fill_in 'restaurant[address]', with: '930 S 9th St'
    fill_in 'restaurant[city]', with: 'Philadel'
    fill_in 'restaurant[state]', with: 'Pennsylvania'
    fill_in 'restaurant[zip]', with: '19147'
    fill_in 'restaurant[description]', with: 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'

    click_button 'Add Restaurant'

    expect(page).to have_content 'Restaurant added successfully'
    expect(page).to have_content 'Di Bruno Bros'
    expect(page).to have_content '930 S 9th St'
    expect(page).to have_content 'Philadel'
    expect(page).to have_content 'Pennsylvania'

    expect(page).to have_content 'This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads.'
  end

  scenario 'visitor does not provide proper information for a restaurant', %(
    When adding a new restaurant, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.
    ) do
    visit new_restaurant_path

    click_button 'Add Restaurant'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
  end
end
