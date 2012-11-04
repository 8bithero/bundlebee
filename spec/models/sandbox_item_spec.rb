require 'spec_helper'

describe SandboxItem do

  let(:user)          { FactoryGirl.create(:user) }
  let(:app)           { FactoryGirl.create(:app)  }
  let(:sandbox_item)  { user.sandbox_items.build(app_id: :app_id) }

  subject { sandbox_item }

  it { should respond_to(:app_id) }
  it { should respond_to(:app) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        SandboxItem.new(user_id: "1")
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { sandbox_item.user_id = nil }
    it { should_not be_valid }
  end

  describe "when app_id is not present" do
    before { sandbox_item.app_id = nil }
    it { should_not be_valid }
  end
end