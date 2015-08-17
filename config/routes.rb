Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'home#index'

  post 'home/sign_in', as: "sign_in"

  namespace :dashboard do
    resources :posts do
      collection do
        get :unpublished
        get 'tags' => "posts#tags"
        get 'tags/:name' => "posts#set_tag"
      end
    end
  end

  scope path: '/dashboard', controller: "dashboard" do
    get 'index', as: "dashboard"
    get 'logout', as: "logout"
  end
end
