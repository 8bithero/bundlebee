class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all(:order => "email")
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      redirect_to users_path
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    if @user == current_user
      flash[:notice] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end
    redirect_to users_path
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end


  private
    def find_user
      @user = User.find(params[:id])
    end

end