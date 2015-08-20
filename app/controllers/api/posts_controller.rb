class API::PostsController < ApplicationController
  before_filter :set_user

  def index
    @posts = @user.posts.published
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def tags
    @tags = @user.posts.select(:tag).uniq
  end

  def show_tag
    @posts = @user.posts.tag(params[:name]).published
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end
end
