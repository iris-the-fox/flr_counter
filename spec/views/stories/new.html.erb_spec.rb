require 'rails_helper'

RSpec.describe "stories/new", type: :view do
  before(:each) do
    assign(:story, Story.new(
      :name => "MyString",
      :link => "MyString",
      :group => nil
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input[name=?]", "story[name]"

      assert_select "input[name=?]", "story[link]"

      assert_select "input[name=?]", "story[group_id]"
    end
  end
end
