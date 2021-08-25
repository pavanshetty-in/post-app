Rails.application.routes.draw do
  
  resources :topics do 
    resources :posts 
  end
  # get 'home/index'
  root 'home#index'
  resources :allposts
  # get '/allposts', to 'allposts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
