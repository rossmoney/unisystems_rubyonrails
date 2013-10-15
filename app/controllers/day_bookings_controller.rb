class DayBookingsController < ApplicationController
 
  # GET /day_bookings
  # GET /day_bookings.json
  def index

    if logged_in_as_office?

      @day_bookings = DayBooking.find(:all)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @day_bookings }
      end

    else
      authenticate_office
    end
  end

  # GET /day_bookings/1
  # GET /day_bookings/1.json
  def show
    if logged_in_as_employee?

      @day_booking = DayBooking.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @day_booking }
      end

    else
      authenticate_employee
    end
  end

  # GET /day_bookings/new
  # GET /day_bookings/new.json
  def new
    if logged_in_as_employee?
      @day_booking = DayBooking.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @day_booking }
      end
    else
      authenticate_employee
    end
  end

  # GET /day_bookings/1/edit
  def edit
    if logged_in_as_employee?
      @day_booking = DayBooking.find(params[:id])
    else
      authenticate_employee
    end

  end

  # POST /day_bookings
  # POST /day_bookings.json
  def create

    if logged_in_as_employee?
      @day_booking = DayBooking.new(params[:day_booking])

      respond_to do |format|
        if @day_booking.save
          format.html { redirect_to @day_booking, :notice => 'Day booking was successfully created.' }
          format.json { render :json => @day_booking, :status => :created, :location => @day_booking }
        else
          format.html { render :action => "new" }
          format.json { render :json => @day_booking.errors, :status => :unprocessable_entity }
        end
      end

    else
      authenticate_employee
    end
  end

  # PUT /day_bookings/1
  # PUT /day_bookings/1.json
  def update
    if logged_in_as_employee?

      @day_booking = DayBooking.find(params[:id])

      respond_to do |format|
        if @day_booking.update_attributes(params[:day_booking])
          format.html { redirect_to @day_booking, :notice => 'Day booking was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @day_booking.errors, :status => :unprocessable_entity }
        end
      end

    else
      authenticate_employee
    end
  end

  # DELETE /day_bookings/1
  # DELETE /day_bookings/1.json
  def destroy
    if logged_in_as_office?

      @day_booking = DayBooking.find(params[:id])
      @day_booking.destroy

      respond_to do |format|
        format.html { redirect_to day_bookings_url }
        format.json { head :no_content }
      end

    else
      authenticate_office
    end
  end
  
end