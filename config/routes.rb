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
  
  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  root "products#index"

  resources :products, only: [:show, :new, :create] do

    resources :images, only: [:new, :create] 
    get 'purchase'
    collection do
      get 'search'
      
      get 'get_child_category', defaults: {format: 'json'}
      get 'get_grandchild_category', defaults: {format: 'json'}
      get 'get_sizes', defaults: {format: 'json'}
      get 'get_brands', defaults: {format: 'json'}
      get 'get_delivery_method', defaults: {format: 'json'}
    end
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  get 'address/create' , to: 'users#address_create'
  post 'address/create' => 'users#address_create'
  post 'user/sms_authenticate' , to: 'users#sms_authenticate'
  resources :users, only: [:new, :create, :destroy, :show] do
    resources :cards, only: [:index, :new, :destroy, :show] do
      collection do
        post 'pay', to: 'cards#pay'
      end
    end
    get 'users/address', to: 'users#address'
    get 'users/complate', to: 'uers#complate'
    collection do
      get 'identification'
      get 'information'
      get 'phonemumber'
      get 'address'
      get 'complete'
      get 'logout'
      get 'credit_unregistered'
      get 'profile'
    end
  end
  resources :categories, only: [:show]

end
