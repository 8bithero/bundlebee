class Api::V1::AppsController < Api::V1::BaseController
  def index
    respond_with(App.all)
  end
end
