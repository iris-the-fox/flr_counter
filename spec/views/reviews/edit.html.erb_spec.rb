require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :story => nil,
      :text => "MyText",
      :link => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[story_id]"

      assert_select "textarea[name=?]", "review[text]"

      assert_select "input[name=?]", "review[link]"

      assert_select "input[name=?]", "review[author]"
    end
  end
end
