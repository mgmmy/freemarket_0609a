Rails.application.routes.draw do
  
  root "products#index"
  resources :products, only: [:show]
  resources :users, only: [:new, :show] do
    collection do
      get 'identification' 
      get 'information' 
      get 'phonemumber' 
      get 'address' 
      get 'howtopay' 
      get 'complete'
  
    end
  end
end