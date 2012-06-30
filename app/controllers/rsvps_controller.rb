class RsvpsController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update]
  before_filter :title
  http_basic_authenticate_with :name => "nathan", :password => "ruby42", :only => [:destroy, :create, :edit]
  
  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
    @users = User.all
    @wedding_yes = Guest.count(:all, :conditions => "wedding = 'yes'")
    @reception_yes = Guest.count(:all, :conditions => "reception = 'yes'")
    @wedding_maybe = Guest.count(:all, :conditions => "wedding = 'maybe'")
    @reception_maybe = Guest.count(:all, :conditions => "reception = 'maybe'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rsvps }
    end
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.json
  def new
    redirect_to edit_rsvp_path(User.find(session[:user_id]).rsvp_id) and return if current_user
    @rsvp = Rsvp.new
    @rsvp.build_user
    @rsvp.guests.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(params[:rsvp])
    respond_to do |format|
      if @rsvp.save
        NewRsvpMailer.new_rsvp_created(@rsvp).deliver
        NewRsvpMailer.new_user_created(@rsvp.user).deliver
        session[:user_id] = @rsvp.user.id 
        format.html { redirect_to @rsvp, notice: 'RSVP was successfully created.' }
        format.json { render json: @rsvp, status: :created, location: @rsvp }
      else
        if @rsvp.errors.full_messages.include?("User email login")
          redirect_to login_path, 
            notice: 'That email already has an RSVP. Please login to edit your RSVP.' and return
        end
        format.html { render action: "new" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.json
  def update
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :ok }
    end
  end

  private

  def authenticate
    redirect_to login_path unless current_user
  end

  def title
    @title = 'RSVP'
  end

end
