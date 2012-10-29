class Api::V1::UsersController < Api::V1::BaseController
  #before_filter :find_project, :only => [:show, :update, :destroy]
  before_filter :authenticate_user!

  def show
    if current_user.id == params[:id].to_i
      respond_with(current_user, :location => api_v1_user_path(current_user))
    else
      raise "nosir"
    end
    #respond_with(current_user)
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