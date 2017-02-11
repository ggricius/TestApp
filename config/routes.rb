Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :products
  get 'static_pages/about'

  get 'static_pages/contact'
  post 'static_pages/thank_you'
  get 'static_pages/index'
  get 'static_pages/landing_page'
  root 'static_pages#contact'
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
