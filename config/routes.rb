Rails.application.routes.draw do

  devise_for :users

  resources :publications do
    put :favorite, on: :member
    resources :comments do
      member do
        put "like" => "comments#upvote"
        put "dislike" => "comments#downvote"
      end
    end
  end

  root "publications#index"
  resources :itineraries
  resources :countries
  resources :towns

  end
