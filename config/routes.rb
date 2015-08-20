Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'home#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get 'dashboard' => 'dashboard#index'

  namespace :dashboard, path: 'dashboard' do
    resources :posts do
      collection do
        get :unpublished
        get 'tags' => "posts#tags"
        get 'tags/:name' => "posts#set_tag"
      end

      get 'switch_status'
    end
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
