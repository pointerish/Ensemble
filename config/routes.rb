Rails.application.routes.draw do
  root :to => "events#index"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events do
    post 'attend', on: :member
  end
  resources :users
end