require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :body => "Body",
        :number => 2,
        :flr => nil
      ),
      Page.create!(
        :body => "Body",
        :number => 2,
        :flr => nil
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
