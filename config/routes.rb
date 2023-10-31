Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hello#index"

  get "/hello", to: "hello#index"

  get "/syusi/list", to: "blances#index", as: "blance_list"
  resources :blances, path: "/syusi", except: [:index]
end
