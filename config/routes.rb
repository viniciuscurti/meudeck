Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  resources :cards, only: [:index, :show]
  resources :cards do
    resources :orders, only: [:show, :create] do
      resources :payments, only: :new
    end
  end
  resources :orders, only: :index
end
  # resources :orders, only: [:index, :show, :create] do
  #   resources :payments, only: :new
  # end

