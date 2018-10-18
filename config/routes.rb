Rails.application.routes.draw do

  get 'products/show'
  get 'categories/index'
  get 'categories/show'
	get 'admin/login', :to => 'admin#index'
  get 'admin/cart', :to => 'admin#order'
  get 'admin/index'
  devise_for :users
  get 'home/index'
  root 'home#index'

namespace :admin do
  resources :categories
end
namespace :admin do
  resources :orders
end
namespace :admin do
  resources :products do
  member do
    delete :delete_image_attachment
  end
end
end
  
  resources 'categories'
  resources 'products'
  resources 'admin'
  resources 'users'
  resources 'carts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
