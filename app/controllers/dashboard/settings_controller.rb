module Dashboard
  class SettingsController < ApplicationController
    def index
      @tags = current_user[:tags]
    end

    def set_tags
      current_user.update_attribute(:tags, params[:tags])
      redirect_to :back
    end

    def generate_api_key
      current_user.generate_api_key
      redirect_to :back
    end
  end
end