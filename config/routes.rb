Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'dashboard#index'

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  get 'dashboard' => 'dashboard#index'

  namespace :dashboard, path: 'dashboard' do
    get '/' => 'dashboard#index'
    get 'api' => 'static_pages#api'

    namespace :settings, path: 'settings' do
      get :index
      post :set_tags
    end

    resources :posts do
      collection do
        get :unpublished
        get :archived
      end

      get 'switch_status'
    end
  end

  namespace :api, :defaults => {:format => :json} do
    resources :users do
      get 'tags' => 'tags#index'

      resources :posts, only: [:index, :show]
    end
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
