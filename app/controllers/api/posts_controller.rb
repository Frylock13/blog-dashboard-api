class API::PostsController < ApplicationController
  before_action :authenticate

  def index
    if params[:tags]
      @posts = @user.posts.published.find_by_sql("SELECT * FROM posts WHERE posts.tags && '{#{params[:tags]}}'")
    else
      @posts = @user.posts.published
    end
  end

  def show
    @post = @user.posts.published.find(params[:id])
  end
end
