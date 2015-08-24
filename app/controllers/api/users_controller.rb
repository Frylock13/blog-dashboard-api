class API::UsersController < ApplicationController
  def tags
    user = User.friendly.find(params[:user_id])
    @tags = user[:tags].split(",")
  end
end
