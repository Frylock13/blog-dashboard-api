require 'rails_helper'

RSpec.describe "dashboard/posts/new", type: :view do
  before(:each) do
    assign(:dashboard_post, Dashboard::Post.new(
      :title => "MyString",
      :short => "MyString",
      :content => "MyText",
      :tag => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new dashboard_post form" do
    render

    assert_select "form[action=?][method=?]", dashboard_posts_path, "post" do

      assert_select "input#dashboard_post_title[name=?]", "dashboard_post[title]"

      assert_select "input#dashboard_post_short[name=?]", "dashboard_post[short]"

      assert_select "textarea#dashboard_post_desc[name=?]", "dashboard_post[desc]"

      assert_select "input#dashboard_post_topic[name=?]", "dashboard_post[topic]"

      assert_select "input#dashboard_post_image[name=?]", "dashboard_post[image]"
    end
  end
end
