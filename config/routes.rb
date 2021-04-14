Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %w[show]

  get 'follow/:id', to: 'users#follow', as: 'user_follow'
  get 'unfollow/:id', to: 'users#unfollow', as: 'user_unfollow'

  resources :posts
end
