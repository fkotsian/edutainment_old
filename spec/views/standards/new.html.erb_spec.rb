require 'spec_helper'

describe "standards/new" do
  before(:each) do
    assign(:standard, stub_model(Standard).as_new_record)
  end

  it "renders new standard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => standards_path, :method => "post" do
    end
  end
end
