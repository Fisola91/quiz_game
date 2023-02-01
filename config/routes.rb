Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create] do
    resources :attempts, only: :create
  end
  resources :sessions, only: [:create, :destroy]
  root to: "sessions#new"
end
