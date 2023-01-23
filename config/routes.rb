Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :messages

  post "user/login", to: "usersauth#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
