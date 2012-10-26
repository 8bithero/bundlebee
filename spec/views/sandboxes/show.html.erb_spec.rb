require 'spec_helper'

describe "sandboxes/show" do
  before(:each) do
    @sandbox = assign(:sandbox, stub_model(Sandbox,
      :user_id => "",
      :app_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
