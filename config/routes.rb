# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants do
    resources :reviews
  end
  resources :categories do
    resources :restaurants
  end
end
