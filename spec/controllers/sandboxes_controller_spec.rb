require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SandboxesController do

  # This should return the minimal set of attributes required to create a valid
  # Sandbox. As you add validations to Sandbox, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SandboxesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sandboxes as @sandboxes" do
      sandbox = Sandbox.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sandboxes).should eq([sandbox])
    end
  end

  describe "GET show" do
    it "assigns the requested sandbox as @sandbox" do
      sandbox = Sandbox.create! valid_attributes
      get :show, {:id => sandbox.to_param}, valid_session
      assigns(:sandbox).should eq(sandbox)
    end
  end

  describe "GET new" do
    it "assigns a new sandbox as @sandbox" do
      get :new, {}, valid_session
      assigns(:sandbox).should be_a_new(Sandbox)
    end
  end

  describe "GET edit" do
    it "assigns the requested sandbox as @sandbox" do
      sandbox = Sandbox.create! valid_attributes
      get :edit, {:id => sandbox.to_param}, valid_session
      assigns(:sandbox).should eq(sandbox)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sandbox" do
        expect {
          post :create, {:sandbox => valid_attributes}, valid_session
        }.to change(Sandbox, :count).by(1)
      end

      it "assigns a newly created sandbox as @sandbox" do
        post :create, {:sandbox => valid_attributes}, valid_session
        assigns(:sandbox).should be_a(Sandbox)
        assigns(:sandbox).should be_persisted
      end

      it "redirects to the created sandbox" do
        post :create, {:sandbox => valid_attributes}, valid_session
        response.should redirect_to(Sandbox.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sandbox as @sandbox" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sandbox.any_instance.stub(:save).and_return(false)
        post :create, {:sandbox => {}}, valid_session
        assigns(:sandbox).should be_a_new(Sandbox)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sandbox.any_instance.stub(:save).and_return(false)
        post :create, {:sandbox => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sandbox" do
        sandbox = Sandbox.create! valid_attributes
        # Assuming there are no other sandboxes in the database, this
        # specifies that the Sandbox created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sandbox.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => sandbox.to_param, :sandbox => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested sandbox as @sandbox" do
        sandbox = Sandbox.create! valid_attributes
        put :update, {:id => sandbox.to_param, :sandbox => valid_attributes}, valid_session
        assigns(:sandbox).should eq(sandbox)
      end

      it "redirects to the sandbox" do
        sandbox = Sandbox.create! valid_attributes
        put :update, {:id => sandbox.to_param, :sandbox => valid_attributes}, valid_session
        response.should redirect_to(sandbox)
      end
    end

    describe "with invalid params" do
      it "assigns the sandbox as @sandbox" do
        sandbox = Sandbox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sandbox.any_instance.stub(:save).and_return(false)
        put :update, {:id => sandbox.to_param, :sandbox => {}}, valid_session
        assigns(:sandbox).should eq(sandbox)
      end

      it "re-renders the 'edit' template" do
        sandbox = Sandbox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sandbox.any_instance.stub(:save).and_return(false)
        put :update, {:id => sandbox.to_param, :sandbox => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sandbox" do
      sandbox = Sandbox.create! valid_attributes
      expect {
        delete :destroy, {:id => sandbox.to_param}, valid_session
      }.to change(Sandbox, :count).by(-1)
    end

    it "redirects to the sandboxes list" do
      sandbox = Sandbox.create! valid_attributes
      delete :destroy, {:id => sandbox.to_param}, valid_session
      response.should redirect_to(sandboxes_url)
    end
  end

end
