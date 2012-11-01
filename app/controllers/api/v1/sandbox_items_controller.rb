class Api::V1::SandboxItemsController < Api::V1::BaseController
  #before_filter :find_project, :only => [:show, :update, :destroy]
  #before_filter :authenticate_user!

  def index
    sandbox = current_user.sandbox_items.all
    respond_with(sandbox)
  end

  def create
    app = App.find(params[:app_id])
    sandbox_item = current_user.add_app!(app)
    #sandbox_item = SandboxItem.create(params[:app_id])
    if sandbox_item.valid?
      respond_with({:success => true, :message => "#{app.name} was successfully added to your Sandbox."}, :status => 201, :location => "nil")
    else
      respond_with({:success => false, :message => "#{app.name} was successfully added to your Sandbox."}, :status => 200, :location => "nil")
    end
  end


  def destroy
    app = App.find(params[:app_id])
    sandbox_item = current_user.remove_app!(app)
    respond_with({:success => true, :message => "App was successfully removed from your Sandbox."}, :status => 200, :location => "nil")
  end

  private

  def find_app
    @app = App.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error = { :error => "The project you were looking for " +
                          "could not be found."}
      respond_with(error, :status => 404)
  end
end