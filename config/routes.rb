Rails.application.routes.draw do


  namespace :dataflix do
  get 'home_lists/index'
  end

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
        get :user_returns_list
        get :send_home
        post :film_format
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
        post :remove_film_from_rental_list
        get :add_film_to_rental_list
        get :user_defaults
        get :previous_films_list
      end
      member do
        get :film_list
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
      get :film_location
      get :barcode
      get :barcode_form
      post :barcode_find
    end
  end

  resources :genres
  resources :ratings

end