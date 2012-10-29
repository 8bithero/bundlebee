class Api::V1::SessionsController < Api::V1::BaseController

  #include Devise::Controllers::InternalHelpers
  
  before_filter :authenticate_user!, :except => [:create, :destroy]
  before_filter :ensure_params_exist

  respond_to :json
  
  def create

    #build_resource
    resource = User.find_for_database_authentication(:email=>params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json => { :success => true, :auth_token => resource.authentication_token, :email => resource.email }
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    resource = User.find_for_database_authentication(:email => params[:user_login][:email])
    resource.authentication_token = nil
    resource.save
    render :json => {:success => true }
  end

  protected
  def ensure_params_exist
  #raise params.inspect

    return unless params[:user_login].blank?
    render :json => { :success => false, :message => "missing user_login parameter #{params.inspect}" }, :status => 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json => { :success => false, :message => "Error with your login or password" }, :status => 401
  end
end