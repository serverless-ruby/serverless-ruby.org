Rails.application.routes.draw do
  root to: 'application#index'

  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/sign-out' => 'sessions#destroy', :as => :signout
end
