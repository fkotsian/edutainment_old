require 'spec_helper'

describe "standards/edit" do
  before(:each) do
    @standard = assign(:standard, stub_model(Standard))
  end

  it "renders the edit standard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => standards_path(@standard), :method => "post" do
    end
  end
end
