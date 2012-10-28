class Api::V1::AppsController < Api::V1::BaseController
  def index
    respond_with(App.all)
  end

  def create
    app = App.create(params[:app])
    if app.valid?
      respond_with(app, :location => api_v1_app_path(app))
    else
      respond_with(app)
    end
  end
end
