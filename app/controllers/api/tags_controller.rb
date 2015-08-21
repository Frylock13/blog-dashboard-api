class API::TagsController < ApplicationController
  before_filter :set_user

  def index
    @tags = @user.posts.published.select(:tag).uniq
  end

  def show
    @posts = @user.posts.tag(params[:name]).published
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end
end
