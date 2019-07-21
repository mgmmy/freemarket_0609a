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

    resources :images, only: [:new, :create] 
    
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
      get 'complete'
      get 'logout'
    end
    
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  
end
