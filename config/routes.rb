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
      get :generate_api_key
      post :set_tags
      patch :upload_avatar
    end

    resources :posts do
      get :switch_status
      get :generate_url

      collection do
        get :unpublished
        get :archived
        get :destroy_all_archived
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    get 'tags' => 'settings#tags'
    get 'avatar' => 'settings#avatar'

    resources :posts, only: [:index, :show]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
