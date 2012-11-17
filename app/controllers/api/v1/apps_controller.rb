class Api::V1::AppsController < Api::V1::BaseController

  # FILTERS
  #-------------------------------------------------------------------
  skip_before_filter :authenticate_user, :only => [:index, :get_android_app_data]


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

  # GET api/v1/apps/get_android_app_data.json                     AJAX
  #-------------------------------------------------------------------
  def get_android_app_data
    gps = GooglePlaySearch::Search.new

    if params[:bundle_id]
      app = gps.get_app_from_bundle_id(params[:bundle_id])
      respond_with(app)

    elsif params[:app_url]
      app = gps.get_app_from_bundle_id(params[:app_url])
      respond_with(app)
    end
  end
end
