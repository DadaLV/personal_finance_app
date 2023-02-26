Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :operations, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :categories
  get "/about", to: "pages#about"
  get "operations/graph"
  get "/statistics", to: "statistics#index"
  get "/statistics/stati", to: "statistics#stati"
  get "/statistics/select_by_category", to: "statistics#select_by_category"


end
