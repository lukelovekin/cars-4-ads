Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users, except: [:index, :new]
root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # delete post view and controllor
end
