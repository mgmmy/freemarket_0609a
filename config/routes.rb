Rails.application.routes.draw do
  root "products#index"
    resources :products
  get 'users/new'

  
end
