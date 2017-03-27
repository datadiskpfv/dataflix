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
      member do
        patch :archive
        patch :unarchive
        patch :make_admin
        patch :undo_admin
      end
    end
  end

  namespace :dataflix do
    resources :settings, only: [] do
      collection do
        get :address
        get :remove_film_from_rental_list
        get :add_film_to_rental_list
      end
      member do
        get :rental_list
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
      get :stock
      post :stock_location
    end
  end

  resources :genres
  resources :ratings

end