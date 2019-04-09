require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :name => "Name",
        :link => "Link",
        :group => nil
      ),
      Story.create!(
        :name => "Name",
        :link => "Link",
        :group => nil
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
