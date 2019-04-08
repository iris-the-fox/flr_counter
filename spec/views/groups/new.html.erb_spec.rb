require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :number => 1,
      :name => "MyString",
      :color => "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input[name=?]", "group[number]"

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[color]"
    end
  end
end
