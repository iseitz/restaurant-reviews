# frozen_string_literal: true

require 'rails_helper'

feature 'visitor sees list of reviews on restaurant page' do
  scenario 'sees reviews for specific restaurant', %(
    A restaurant can have many reviews. Each review must contain the following:
    A rating
    A body
    A timestamp for when it was created
    Visiting the `/restaurants/:id` path should also include all reviews for a restaurant with ID = :id.
    ) do
    dumpling_king = FactoryBot.create(:restaurant_with_reviews, name: 'Dumpling King')
    review_for_dumplings = dumpling_king.reviews[0]
    review_for_dumplings1 = dumpling_king.reviews[1]

    visit restaurant_path(dumpling_king)

    expect(page).to have_content dumpling_king.name
    expect(page).to have_content review_for_dumplings.rating
    expect(page).to have_content review_for_dumplings.body
    expect(page).to have_content review_for_dumplings1.rating
    expect(page).to have_content review_for_dumplings1.body
    expect(page).to have_content review_for_dumplings.created_at.strftime('%B %d %Y')
  end

  scenario 'does not see other reviews for other restaurants' do
    dumpling_king = FactoryBot.create(:restaurant_with_reviews, name: 'Dumpling King')
    review_for_dumplings = dumpling_king.reviews[0]
    review_for_dumplings1 = dumpling_king.reviews[1]
    rock_bottom = FactoryBot.create(:restaurant_with_reviews, name: 'Rock Bottom')
    review_for_rock = rock_bottom.reviews[0]
    review_for_rock1 = rock_bottom.reviews[1]

    visit restaurant_path(rock_bottom)

    expect(page).to have_content rock_bottom.name
    expect(page).to have_content review_for_rock.body
    expect(page).to have_content review_for_rock1.body

    expect(page).not_to have_content dumpling_king.name
    expect(page).not_to have_content 'rating' + review_for_dumplings.rating.to_s
    expect(page).not_to have_content review_for_dumplings.body
  end
end
