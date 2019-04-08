require 'rails_helper'

RSpec.describe "flrs/new", type: :view do
  before(:each) do
    assign(:flr, Flr.new())
  end

  it "renders new flr form" do
    render

    assert_select "form[action=?][method=?]", flrs_path, "post" do
    end
  end
end
