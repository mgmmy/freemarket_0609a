Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations:      'users/registrations',
    sessions:           'users/sessions'
  }
  
  root "products#index"
  resources :products, only: [:show, :new, :create] do
    collection do
     get 'itemlist'
      get 'purchase'
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
    end
  end
  
end
