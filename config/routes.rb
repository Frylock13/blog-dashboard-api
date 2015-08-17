Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  namespace :dashboard do
    resources :posts do
      collection do
        get :unpublished
        get 'tags' => "posts#tags"
      end
    end
  end
  root 'home#index'

  scope path: '/dashboard', controller: "dashboard" do
    get 'index', as: "dashboard"
    get 'logout', as: "logout"
  end

  post 'home/sign_in', as: "sign_in"
end
