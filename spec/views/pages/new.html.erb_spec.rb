require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      :body => "MyString",
      :number => 1,
      :flr => nil
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input[name=?]", "page[body]"

      assert_select "input[name=?]", "page[number]"

      assert_select "input[name=?]", "page[flr_id]"
    end
  end
end
