Rails.application.routes.draw do
  get 'sessions/new'

  get 'admins/new'

  resources :admins, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
