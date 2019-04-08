require 'rails_helper'

RSpec.describe "flrs/show", type: :view do
  before(:each) do
    @flr = assign(:flr, Flr.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
