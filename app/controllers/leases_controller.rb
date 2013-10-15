class LeasesController < ApplicationController
  before_filter :authenticate_office
  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @leases }
    end
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
    @lease = Lease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lease }
    end
  end

  # GET /leases/new
  # GET /leases/new.json
  def new
    @lease = Lease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lease }
    end
  end

  # GET /leases/1/edit
  def edit
    @lease = Lease.find(params[:id])
  end

  # POST /leases
  # POST /leases.json
  def create
    @lease = Lease.new(params[:lease])

    respond_to do |format|
      if @lease.save
        car = Car.where(:registration => @lease.registration).first
        car.update_attributes(:longtermassigned => true)
        format.html { redirect_to cars_url, :notice => 'Lease was successfully created.' }
        format.json { render :json => @lease, :status => :created, :location => @lease }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lease.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leases/1
  # PUT /leases/1.json
  def update
    @lease = Lease.find(params[:id])

    respond_to do |format|
      if @lease.update_attributes(params[:lease])
        format.html { redirect_to cars_url, :notice => 'Lease was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lease.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease = Lease.find(params[:id])

    car = Car.where(:registration => @lease.registration).first
    car.update_attributes(:longtermassigned => false)
    
    @lease.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end
end
