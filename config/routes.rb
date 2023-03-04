Rails.application.routes.draw do
  resources :conversations
  resources :friends
  resources :users, only: [:create] do
    resources :friends
  end

  resources :messages

  post "/user/login", to: "usersauth#create"
  get "/user/login", to: "usersauth#new"
  mount ActionCable.server => "/cable"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
