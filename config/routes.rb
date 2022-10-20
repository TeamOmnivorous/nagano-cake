Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
# devise_for :customers, :controllers => {
#     :registrations => 'customers/registrations',
#     :sessions => 'customers/sessions'
#   }
#   devise_scope :customers do
#     get "sign_in", :to => "customers/sessions#new"
#     get "/customers/sign_out", :to => "customers/sessions#destroy"
#   end

  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"

  resources :customers
  resources :cart_items
  resources :orders
  resources :deliveries
  resources :items


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
