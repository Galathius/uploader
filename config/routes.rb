Rails.application.routes.draw do
  mount Uploader::API => '/'

  root 'home#index'
  resources :home, only: [:index]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign-in' => 'sessions#new', :as => :sign_in
  get '/sign-out' => 'sessions#destroy', :as => :sign_out
  get '/auth/failure' => 'sessions#failure'

  resources :videos
end
