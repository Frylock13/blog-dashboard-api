class API::UsersController < ApplicationController
  before_action :authenticate
  
  def tags
    user = User.friendly.find(params[:user_id])
    @tags = user[:tags].split(",")
  end
end
