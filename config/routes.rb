Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#home"

  get "/hello", to: "hello#index"

  resources :blances, path: "/syusi" do
    get "/history", to: "histories#index"
    resources :histories, only: %i[create update destroy]
  end
end
