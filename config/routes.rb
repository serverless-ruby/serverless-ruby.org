Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts

  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/sign-out' => 'sessions#destroy', :as => :signout

  get '/petition' => 'application#petition', :as => :petition
end
