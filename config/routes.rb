Rails.application.routes.draw do
 root 'items#index'
 resources :items
 #get "/items", to: "items#index"
 #get "/items/:id", to: "items#show", as: "item"
 #get "/items/:id/edit", to: "items#edit", as: "edit_item"
 #patch "/items/:id", to: "items#update"

 resources :users
end
