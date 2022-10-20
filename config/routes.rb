Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
 # devise_for :customers

  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"

  resources :customers
  resources :cart_items
  resources :orders
  resources :deliveries
  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
