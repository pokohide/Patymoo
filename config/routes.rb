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
    put '/', to: 'admins#update', as: 'update'
    get '/edit', to: 'admins#edit', as: 'edit'

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
          post 'attend', to: 'members#attend', as: 'attend'
          delete 'attend', to: 'members#disattend', as: 'disattend'
        end
      end
    end
  end
end
