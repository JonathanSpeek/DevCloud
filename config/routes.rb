Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get 'welcome/index'
  resources :notes
  resources :uploads

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
  end

  root 'welcome#index'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources 'contacts', only: [:new, :create]
end