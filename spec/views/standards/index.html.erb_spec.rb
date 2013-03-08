require 'spec_helper'

describe "standards/index" do
  before(:each) do
    assign(:standards, [
      stub_model(Standard),
      stub_model(Standard)
    ])
  end

  it "renders a list of standards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
