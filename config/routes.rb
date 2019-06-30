Rails.application.routes.draw do

  
  
  root "products#index"
  resources :products, only: [:show] do
    collection do
     get 'itemlist'
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