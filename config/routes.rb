Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"

  resources :customers
  resources :cart_items
  resources :orders
  resources :deliveries
  resources :items

  namespace :admin do
    get '/'  => "homes#top", as: "/"
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_items
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
