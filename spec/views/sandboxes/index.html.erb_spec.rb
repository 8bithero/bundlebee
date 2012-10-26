require 'spec_helper'

describe "sandboxes/index" do
  before(:each) do
    assign(:sandboxes, [
      stub_model(Sandbox,
        :user_id => "",
        :app_id => ""
      ),
      stub_model(Sandbox,
        :user_id => "",
        :app_id => ""
      )
    ])
  end

  it "renders a list of sandboxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
