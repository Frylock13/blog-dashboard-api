class HomeController < ApplicationController
  def index
    redirect_to (current_user ? login_path : dashboard_path)
  end
end
