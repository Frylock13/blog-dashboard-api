module Dashboard
  class StaticPagesController < ApplicationController
    def api
      @user = current_user
    end
  end
end