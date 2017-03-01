Rails.application.routes.draw do

  ## the administration area
  namespace :admin do
    root 'application#index'
  end

end