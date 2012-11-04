class Api::V1::AppsController < Api::V1::BaseController

  # FILTERS
  #-------------------------------------------------------------------
  skip_before_filter :authenticate_user, :only => [:index]


  # GET api/v1/apps.json                                          AJAX
  #-------------------------------------------------------------------
  def index
    respond_with(App.all)
  end


  # POST api/v1/apps.json                                         AJAX
  #-------------------------------------------------------------------
  def create
    app = App.create(params[:app])
    if app.valid?
      respond_with(app, :location => api_v1_app_path(app))
    else
      respond_with(app)
    end
  end
end
