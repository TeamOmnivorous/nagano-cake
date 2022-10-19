Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  devise_for :customers
  devise_for :admins
 # devise_for :customers
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
