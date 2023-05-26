Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
  end
  get 'likes/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
  resources :comments, only: [:create]
  resources :comments, only: [:destroy]
  resources :likes, only: [:create]
  end
  end
  namespace :api, defaults: { format: 'json' } do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :create]
      resources :likes, only: [:create]
      end
    end
  end
end
