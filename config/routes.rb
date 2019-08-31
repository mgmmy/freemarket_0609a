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
    post "login", to: "users#login"
  end
  
  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  root "products#index"
  resources :products do

    resources :images, only: [:new, :create] 
    collection do

      match 'search' => 'products#search', via: [:get, :post]
      get 'search_category', defaults: {format: 'json'}
      get 'search_grandchild_category', defaults: {format: 'json'}
      get 'search_size_id', defaults: {format: 'json'}
      get 'purchase'
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
  post 'address/create' , to: 'users#address_create'
  get 'address/phonemumber', to: 'addresses#phonemumber'
  post 'address/tel' , to: 'addresses#tel'
  get 'address/address', to: 'addresses#address'
  post 'address/address_comp', to: 'addresses#address_comp'
    
  post 'user/sms_authenticate' , to: 'users#sms_authenticate'
  resources :users do
    resources :cards, only: [:index, :new, :destroy, :show] do
      collection do
        post 'pay', to: 'cards#pay'
      end
    end
    get 'logout'
    collection do
      get 'identification'
      get 'information'
      get 'complete'
      get 'credit_unregistered'
      get 'profile'
    end
  end
  
  resources :categories, only: [:show]

end
