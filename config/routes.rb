Rails.application.routes.draw do
 
  root "posts#index"

   get '/about', to: 'pages#about', as: 'about'
   get '/advertiser', to: 'pages#advertiser', as:  'advertiser'
   get '/driver', to: 'pages#driver', as: 'driver'
 
  resources :posts do
    post '/comments', to: 'comments#create', as: 'comments'
    patch '/comments/:comment_id', to: 'comments#update'
    delete '/comments/:comment_id', to: 'comments#destroy', as: "destroy_comment"
  end
 
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, except: [:index, :new]


end
