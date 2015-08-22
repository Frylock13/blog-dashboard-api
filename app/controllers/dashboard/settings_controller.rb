module Dashboard
  class SettingsController < ApplicationController
    def index
      @user = current_user
    end

    def set_tags
      current_user.update_attribute(:tags, params[:tags])
      redirect_to :back
    end
  end
end