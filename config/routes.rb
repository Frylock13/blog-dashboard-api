Rails.application.routes.draw do
  root 'home#index'

  scope path: '/dashboard', controller: "dashboard" do
    get 'index', as: "dashboard"
    get 'logout', as: "logout"
  end

  post 'home/sign_in', as: "sign_in"
end
