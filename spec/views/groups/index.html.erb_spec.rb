require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :number => 2,
        :name => "Name",
        :color => "Color"
      ),
      Group.create!(
        :number => 2,
        :name => "Name",
        :color => "Color"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
