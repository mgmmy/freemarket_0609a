Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root "products#index"
  resources :products, only: [:show] do
    collection do
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