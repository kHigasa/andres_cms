Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'pages#home'
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end
end
