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
      respond_with(sandbox_item)#, :location => api_v1_sandbox_path(sandbox_item))
    else
      respond_with(sandbox_item)
    end
  end


  def destroy
    @project.destroy
    respond_with(@project)
  end

  private

  def find_project
    @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error = { :error => "The project you were looking for " +
                          "could not be found."}
      respond_with(error, :status => 404)
  end
end