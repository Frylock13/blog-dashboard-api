class API::TagsController < ApplicationController
  before_filter :set_user

  def index
    @tags = @user[:tags].split(",")
  end

  def show
    @posts = @user.posts.find_by_sql("SELECT * FROM posts WHERE posts.tags && '{#{params[:name]}}'")
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end
end
