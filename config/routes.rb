Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'pages#home'
  resources :users do
    member do
      patch 'activate'
      patch 'suspend'
    end
  end
  resources :posts
  resources :about_items do
    member do
      patch 'move_first'
      patch 'move_previous'
      patch 'move_next'
      patch 'move_last'
    end
  end
  get '/about', to: 'about_items#index'
end
