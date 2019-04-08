require 'rails_helper'

RSpec.describe "flrs/edit", type: :view do
  before(:each) do
    @flr = assign(:flr, Flr.create!())
  end

  it "renders the edit flr form" do
    render

    assert_select "form[action=?][method=?]", flr_path(@flr), "post" do
    end
  end
end
