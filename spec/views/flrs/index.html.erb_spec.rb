require 'rails_helper'

RSpec.describe "flrs/index", type: :view do
  before(:each) do
    assign(:flrs, [
      Flr.create!(),
      Flr.create!()
    ])
  end

  it "renders a list of flrs" do
    render
  end
end
