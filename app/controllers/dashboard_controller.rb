class DashboardController < ApplicationController
  before_action :authenticate

  def index
  end

  def logout
    session.delete(:password)
    redirect_to root_path
  end
end
