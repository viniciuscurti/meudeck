Rails.application.routes.draw do
  devise_for :users

  get "my_profile", to: "pages#my_profile"

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  resources :cards do
    resources :orders, only: :create
  end

  resources :orders, only: :index
end
