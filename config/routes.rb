Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :moves do
    resources :bids, only: %i[create new]
  end
  resources :bids, except: %i[create new]

  get "/clients", to: "moves#client_index", as: "client"
  get "/companies", to: "moves#company_index", as: "company"
  resources :company do
    resources :review, only: %i[new create edit delete update]
  end
end
