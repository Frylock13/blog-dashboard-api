class API::SettingsController < ApplicationController
  before_action :authenticate

  def tags
    user = User.first
    @tags = user[:tags].split(',')
  end
end
