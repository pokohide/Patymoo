Rails.application.routes.draw do
  resources :admins, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
