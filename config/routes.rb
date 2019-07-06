Rails.application.routes.draw do

  devise_for :users
  root "products#index"
  resources :products, only: [:show, :new]
  resources :users, only: [:new, :show] do
    collection do
      get 'identification' 
    end
  end
  
end
