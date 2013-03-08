require 'spec_helper'

describe "standards/show" do
  before(:each) do
    @standard = assign(:standard, stub_model(Standard))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
