Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :identities
    resources :notes
    resources :uploads

    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  get 'welcome/index'
  resources :notes
  resources :uploads
  resources :charges

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
  end

  root 'welcome#index'
  get '/prices' => 'welcome#prices'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources 'contacts', only: [:new, :create]
end
