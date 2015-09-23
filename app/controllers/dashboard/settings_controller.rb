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

    def upload_avatar
      @user = User.find(current_user.id)
      @user.update_attribute(:image, params[:user][:image])
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
