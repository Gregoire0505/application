Rails.application.routes.draw do

  devise_for :users
  resources :publications
  root "publications#index"
  resource :itineraries
  resource :countries
  resource :comments

  end
