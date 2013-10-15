require 'test_helper'

class DayBookingsControllerTest < ActionController::TestCase
  setup do
    @day_booking = day_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_booking" do
    assert_difference('DayBooking.count') do
      post :create, :day_booking => { :day => @day_booking.day, :registration => @day_booking.registration, :username => @day_booking.username }
    end

    assert_redirected_to day_booking_path(assigns(:day_booking))
  end

  test "should show day_booking" do
    get :show, :id => @day_booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @day_booking
    assert_response :success
  end

  test "should update day_booking" do
    put :update, :id => @day_booking, :day_booking => { :day => @day_booking.day, :registration => @day_booking.registration, :username => @day_booking.username }
    assert_redirected_to day_booking_path(assigns(:day_booking))
  end

  test "should destroy day_booking" do
    assert_difference('DayBooking.count', -1) do
      delete :destroy, :id => @day_booking
    end

    assert_redirected_to day_bookings_path
  end
end
