require 'rails_helper'

RSpec.describe "stories/edit", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :name => "MyString",
      :link => "MyString",
      :group => nil
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input[name=?]", "story[name]"

      assert_select "input[name=?]", "story[link]"

      assert_select "input[name=?]", "story[group_id]"
    end
  end
end
