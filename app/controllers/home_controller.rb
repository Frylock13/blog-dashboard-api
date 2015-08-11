class HomeController < ApplicationController
  def index
  end

  def sign_in
    if params[:password] == ENV["USERNAME"]
      session[:password] = params[:password]
      redirect_to dashboard_path
    else
      redirect_to :back
    end
  end
end
