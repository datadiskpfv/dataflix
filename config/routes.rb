Rails.application.routes.draw do

  devise_for :users

  root "films#index"

  ## the administration area
  namespace :admin do
    root 'application#index'
    resources :countries
    resources :counties
    resources :postcodes
    resources :addresses
  end

  resources :films do
    collection do
      get :table
      get :search_table
      post :search_table
      get :genre_chart
      get :import
      post :imports
    end
  end

  resources :genres
  resources :ratings

end