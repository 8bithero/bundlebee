class SandboxItemsController < ApplicationController
  # GET /sandboxes
  # GET /sandboxes.json
  def index
    unless defined? current_user
      @sandbox = current_user.sandboxes.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @sandbox }
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, alert: 'Get the hell outta here!' }
        format.json { render json: { :error => "Get the hell outta here!" } }
      end
    end
  end

  # GET /sandboxes/1
  # GET /sandboxes/1.json
  #def show
  #  @sandbox = Sandbox.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @sandbox }
  #  end
  #end

  # GET /sandboxes/new
  # GET /sandboxes/new.json
  #def new
  #  @sandbox = Sandbox.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @sandbox }
  #  end
  #end

  # GET /sandboxes/1/edit
  #def edit
  #  @sandbox = Sandbox.find(params[:id])
  #end

  # POST /sandboxes
  # POST /sandboxes.json
  #def create
  #  @sandbox = Sandbox.new(params[:sandbox])

  #  respond_to do |format|
  #    if @sandbox.save
  #      format.html { redirect_to @sandbox, notice: 'Sandbox was successfully created.' }
  #      format.json { render json: @sandbox, status: :created, location: @sandbox }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @sandbox.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def create
    @app = App.find(params[:sandbox][:app_id])
    current_user.add_app!(@app)
    redirect_to :root
  end

  def destroy
    @app = Sandbox.find(params[:id]).app
    current_user.remove_app!(@app)
    redirect_to :root
  end

  #def create
  #  raise "hellooooooooooo!"
  #  company = Company.find(params[:assignment][:company_id])
  #  @assignment = company.assignments.build(params[:assignment])
  #  if @assignment.save
  #    flash[:success] = "#{@assignment.user.username} now has #{@assignment.role.name} status at #{company.name}."
  #    redirect_to company
  #  else  
  #    redirect_to :back
  #  end
  #end

  # PUT /sandboxes/1
  # PUT /sandboxes/1.json
  #def update
  #  @sandbox = Sandbox.find(params[:id])

  #  respond_to do |format|
  #    if @sandbox.update_attributes(params[:sandbox])
  #      format.html { redirect_to @sandbox, notice: 'Sandbox was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @sandbox.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /sandboxes/1
  # DELETE /sandboxes/1.json
  #def destroy
  #  @sandbox = Sandbox.find(params[:id])
  #  @sandbox.destroy

  #  respond_to do |format|
  #    format.html { redirect_to sandboxes_url }
  #    format.json { head :no_content }
  #  end
  #end
end
