class DashboardController < ApplicationController
  before_action :authorize

  def index
  end

  private

    def authorize
      unless true
        redirect_to root_path
      end
    end
end
