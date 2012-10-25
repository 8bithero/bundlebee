class AppsController < ApplicationController
  def index
  end

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(params[:app])
    if @app.save
      flash[:notice] = "App has been created."
      redirect_to @app
    else
      flash[:alert] = "App has not been created."
      render :action => 'new'
    end
  end
end
