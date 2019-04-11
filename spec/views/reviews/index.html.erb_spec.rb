require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :story => nil,
        :text => "MyText",
        :link => "Link",
        :author => "Author"
      ),
      Review.create!(
        :story => nil,
        :text => "MyText",
        :link => "Link",
        :author => "Author"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
  end
end
