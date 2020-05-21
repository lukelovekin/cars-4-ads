Rails.application.routes.draw do
 
  root "posts#index"

   get '/about', to: 'pages#about', as: 'about'
   get '/advertisers', to: 'posts#advertisers', as:  'advertisers'
   get '/drivers', to: 'posts#drivers', as: 'drivers'
 
  resources :posts do
    post '/comments', to: 'comments#create', as: 'comments'
    patch '/comments/:comment_id', to: 'comments#update'
    delete '/comments/:comment_id', to: 'comments#destroy', as: "destroy_comment"
  end
 
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, except: [:index, :new]


end
