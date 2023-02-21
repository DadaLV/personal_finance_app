Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :operations, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :categories

end
