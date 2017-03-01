Rails.application.routes.draw do

  root "films#index"

  ## the administration area
  namespace :admin do
    root 'application#index'
  end

  resources :films
  resources :genres
  resources :ratings

end