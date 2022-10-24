Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "homes#top"
  get '/about' => "homes#about", as: "about"

  resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
         delete 'destroy_all'
      end
    end

  get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  get "/customers/my_page" => "customers#show", as: "my_page"
  get "/customers/infomation/edit" => "customers#edit", as: "infomation/edit"
  patch "/customers/infomation" => "customers#update", as: "infomation"
  resources :customers


  post '/orders/confirm' => 'orders#confirm', as: "confirm"
  get '/orders/complete' => 'orders#complete', as: "complete"
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
