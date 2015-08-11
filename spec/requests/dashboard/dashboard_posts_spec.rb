require 'rails_helper'

RSpec.describe "Dashboard::Posts", type: :request do
  describe "GET /dashboard_posts" do
    it "works! (now write some real specs)" do
      get dashboard_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
