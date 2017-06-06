Rails.application.routes.draw do
  
  
 root 'items#index'
 resources :items do 
 	resources :reviews
 	resources :favorites
 end
 #get "/items", to: "items#index"
 #get "/items/:id", to: "items#show", as: "item"
 #get "/items/:id/edit", to: "items#edit", as: "edit_item"
 #patch "/items/:id", to: "items#update"

 resources :users

 get "/signup" => 'users#new'

 resource :session
end
