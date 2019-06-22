Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:show]
  resources :users, only: [:new]
end
