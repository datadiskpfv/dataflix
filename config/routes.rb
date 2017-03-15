Rails.application.routes.draw do

  root "films#index"

  ## the administration area
  namespace :admin do
    root 'application#index'
    resources :countries
    resources :counties
  end

  resources :films do
    collection do
      get :table
      get :search_table
      post :search_table
      get :genre_chart
    end
  end

  resources :genres
  resources :ratings

end