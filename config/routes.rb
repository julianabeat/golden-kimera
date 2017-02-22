Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :products
  
  get 'static_pages/about', to: 'static_pages#about', as:'about'

  get 'static_pages/contact', to: 'static_pages#contact', as:'contact'

  get 'static_pages/index', to: 'static_pages#index', as:'index'

  get 'static_pages/landing_page', to:'static_pages#landing_page', as:'landing_page'

  post 'static_pages/thank_you'

  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
