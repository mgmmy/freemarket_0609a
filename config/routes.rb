Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations:      'users/registrations',
    sessions:           'users/sessions'
  }
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "users/registration", to: "users#registration"
  end
  
  root "products#index"
  resources :products, only: [:show, :new, :create, :edit, :update] do

    resources :images, only: [:new, :create] 
    
    collection do
      get 'purchase'
      get 'get_child_category', defaults: {format: 'json'}
      get 'get_grandchild_category', defaults: {format: 'json'}
      get 'get_sizes', defaults: {format: 'json'}
      get 'get_brands', defaults: {format: 'json'}
      get 'get_delivery_method', defaults: {format: 'json'}
    end
  end
  resources :users, only: [:new, :show, :create, :destroy] do
    collection do
      get 'identification'
      get 'information'
      get 'phonemumber'
      get 'address'
      get 'howtopay'
      get 'complete'
      get 'logout'
      get 'credit_unregistered'
      get 'profile'
    end
  end

  resources :categories, only: [:show]
  
end
