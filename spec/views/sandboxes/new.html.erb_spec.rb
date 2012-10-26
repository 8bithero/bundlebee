require 'spec_helper'

describe "sandboxes/new" do
  before(:each) do
    assign(:sandbox, stub_model(Sandbox,
      :user_id => "",
      :app_id => ""
    ).as_new_record)
  end

  it "renders new sandbox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sandboxes_path, :method => "post" do
      assert_select "input#sandbox_user_id", :name => "sandbox[user_id]"
      assert_select "input#sandbox_app_id", :name => "sandbox[app_id]"
    end
  end
end
