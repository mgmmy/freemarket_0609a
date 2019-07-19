Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "users/registration", to: "users#registration"
  end
  
  root "products#index"
  resources :products, only: [:show, :new, :create] do
    collection do
      get 'itemlist'
      get 'purchase'
    end
  end
  resources :users, only: [:new, :show] do
    collection do
      get 'identification' 
      get 'information' 
      get 'phonemumber' 
      get 'address' 
      get 'howtopay' 
      get 'complete'
      get 'logout'
    end
  end
  
end
