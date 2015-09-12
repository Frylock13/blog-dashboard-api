class API::SettingsController < ApplicationController
  before_action :authenticate

  def tags
    @tags = @user[:tags].split(',')
  end

  def avatar
    @avatar = @user.image(:medium)
  end
end
