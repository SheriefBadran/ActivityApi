Rails.application.routes.draw do

  # Api routing
  namespace :api, path: '/', constraits: {subdomain: 'api'} do

    resources :creators, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :activities, except: :patch

    get '/creators/:id/activities' => 'creators#show'
    get '/activities/:category' => 'activities#show'
    get '/activities/:id' => 'activities#show'
    get '/positions/geocoder' => 'positions#geocoder'
    post '/auth' => 'sessions#api_auth'
    post '/positions' => 'positions#create'
    #post '/activities' => 'activities#create'
  end

  # Api Key Registration App Routing
  devise_for :users
  resources :dashboard, only: [:index, :edit]
  resources :adminboard, only: [:index, :destroy]

  root to: 'home#index'

  get '/adminboard/:id' => 'adminboard#destroy'
end
