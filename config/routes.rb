Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :moves do
    resources :bids, only: %i[new edit update delete create index]
  end
  resources :bids, only: [:show]


  get "/clients", to: "moves#client_index", as: "client"
  get "/companies", to: "moves#company_index", as: "company"
  get "/companies/bids", to: "bids#index", as: "company_bids"

  resources :company do
    resources :reviews, only: %i[new create edit delete update]
  end
  get "/company/:id", to: "company#show", as: "company_show"
  resources :chatrooms, only: %i[new create show] do
    resources :messages, only: :create
  end
end
