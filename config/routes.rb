Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/create", to: "moves#create_home"
  resources :moves do
    resources :bids, only: %i[new edit update  create index]
  end
  resources :bids, only: [:show]

  patch '/companies/bids', to: 'bids#confirm', as: 'confirm_bid'
  patch 'moves/:move_id/bids/:id/hire', to: 'bids#hire', as: 'hire_bid'
  get "/bids", to: "bids#index", as: "bids"
  get "/clients", to: "moves#client_index", as: "client"
  get "/companies", to: "moves#company_index", as: "company"
  get "/companies/bids", to: "bids#index", as: "company_bids"
  post "/update_bid_status", to: "bids#update_bid_status"
  resources :company do
    resources :reviews, only: %i[new create edit delete update]
  end
  get "/company/:id", to: "company#show", as: "company_show"
  resources :chatrooms, only: %i[new create show] do
    resources :messages, only: :create
  end
      resources :bids, only: %i[ delete]

end
