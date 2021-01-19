Rails.application.routes.draw do
  root :to => "events#index"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/attend', to: 'attendants#create'
  resources :events
  resources :users
end