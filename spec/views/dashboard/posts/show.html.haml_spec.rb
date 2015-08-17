require 'rails_helper'

RSpec.describe "dashboard/posts/show", type: :view do
  before(:each) do
    @dashboard_post = assign(:dashboard_post, Dashboard::Post.create!(
      :title => "Title",
      :short => "Short",
      :content => "MyText",
      :tag => "Topic",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Short/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Topic/)
    expect(rendered).to match(/Image/)
  end
end
