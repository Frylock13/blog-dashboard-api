require 'rails_helper'

RSpec.describe "dashboard/posts/index", type: :view do
  before(:each) do
    assign(:dashboard_posts, [
      Dashboard::Post.create!(
        :title => "Title",
        :short => "Short",
        :desc => "MyText",
        :topic => "Topic",
        :image => "Image"
      ),
      Dashboard::Post.create!(
        :title => "Title",
        :short => "Short",
        :desc => "MyText",
        :topic => "Topic",
        :image => "Image"
      )
    ])
  end

  it "renders a list of dashboard/posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Short".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
