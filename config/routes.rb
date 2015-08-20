Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'home#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get 'dashboard' => 'dashboard#index'

  namespace :dashboard, path: 'dashboard' do
    get '/' => 'dashboard#index'

    resources :posts do
      collection do
        get :unpublished
      end

      get 'switch_status'
    end
  end

  namespace :api, :defaults => {:format => :json} do
    resources :users do
      resources :posts, only: [:index, :show] do
        collection do
          get 'tags' => "posts#tags"
          get 'tags/:name' => "posts#show_tag"
        end
      end
    end
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
