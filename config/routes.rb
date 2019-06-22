Rails.application.routes.draw do

  devise_for :users
  root "products#index"
  resources :products, only: [:show]
<<<<<<< HEAD
<<<<<<< HEAD
  resources :users, only: [:new, :show]
=======
  resources :users
>>>>>>> master
=======
  resources :users
>>>>>>> master

end
