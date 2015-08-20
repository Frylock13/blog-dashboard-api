Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'home#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  namespace :dashboard do
    resources :posts do
      collection do
        get :unpublished
        get 'tags' => "posts#tags"
        get 'tags/:name' => "posts#set_tag"
      end

      get 'switch_status'
    end
  end

  scope path: '/dashboard', controller: "dashboard" do
    get 'index', as: 'dashboard'
  end

  resources :users
  resources :sessions
end
