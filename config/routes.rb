Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :identities
    resources :folders
    resources :notes
    resources :uploads

    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks',  registrations: 'registrations' }
  get 'welcome/index'
  resources :folders
  resources :notes
  resources :uploads
  resources :charges
  get 'search_results/index', to: 'search_results#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  authenticated :user do
    root 'folders#index', as: 'authenticated_root'
  end

  root 'welcome#index'
  get '/prices', to: 'welcome#prices'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources 'contacts', only: [:new, :create]
end
