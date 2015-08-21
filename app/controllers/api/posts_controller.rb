class API::PostsController < ApplicationController
  before_filter :set_user

  def index
    @posts = @user.posts.published
  end

  def show
    @post = @user.posts.published.find(params[:id])
  end

  def tags
    @tags = @user.posts.published.select(:tag).uniq
  end

  def tag_posts
    @posts = @user.posts.tag(params[:name]).published
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end
end
