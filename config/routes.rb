Rails.application.routes.draw do

 
  resources :posts do
    post '/comments', to: 'comments#create', as: 'comments'
    patch '/comments/:comment_id', to: 'comments#update'
    delete '/comments/:comment_id', to: 'comments#destroy'
  end
 
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, except: [:index, :new]
root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # delete post view and controllor
end
