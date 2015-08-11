Rails.application.routes.draw do
  root 'home#index'

  get 'dashboard/index', as: "dashboard", path: "dashboard"

  post 'home/sign_in', as: "sign_in"
end
