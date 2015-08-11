class DashboardController < ApplicationController
  before_action :authorize

  def index
  end

  def logout
    session.delete(:password)
    redirect_to root_path
  end
end
