class SessionsController < ApplicationController
  def new
    redirect_to dashboard_posts_path if current_user
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    
    if user
      auto_login(user)
      redirect_to dashboard_posts_path
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
