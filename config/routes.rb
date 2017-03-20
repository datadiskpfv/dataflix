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

    resources :users, only: [] do
      collection do
        get :search_edit
        post :search_table
      end
    end
  end

  namespace :dataflix do
    resources :settings, only: [] do
      collection do
        get :address
      end
    end
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