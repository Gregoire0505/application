Rails.application.routes.draw do

  devise_for :users
  resources :publications
  root "publications#index"
  resources :itineraries
  resources :countries
  resources :comments

  end
