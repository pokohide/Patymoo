Rails.application.routes.draw do
  root to: 'sites#index'

  resources :admins, only: [:new, :create, :show] do
    member do
      get :activate
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:create, :edit, :update]

  get 'signup', to: 'admins#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    get '/', to: 'admins#index', as: 'dashboard'
    resources :events do
      resources :attends, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :members
  end

  namespace :api do
    namespace :v1 do
      resources :members, only: [] do
        collection do
          get '/search', to: 'members#search', as: 'search'
        end
      end
    end
  end
end
