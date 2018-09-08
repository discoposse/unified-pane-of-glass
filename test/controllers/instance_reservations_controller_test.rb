require 'test_helper'

class InstanceReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instance_reservation = instance_reservations(:one)
  end

  test "should get index" do
    get instance_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_instance_reservation_url
    assert_response :success
  end

  test "should create instance_reservation" do
    assert_difference('InstanceReservation.count') do
      post instance_reservations_url, params: { instance_reservation: { reservable_instance_id: @instance_reservation.reservable_instance_id, reservation_owner_id: @instance_reservation.reservation_owner_id } }
    end

    assert_redirected_to instance_reservation_url(InstanceReservation.last)
  end

  test "should show instance_reservation" do
    get instance_reservation_url(@instance_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_instance_reservation_url(@instance_reservation)
    assert_response :success
  end

  test "should update instance_reservation" do
    patch instance_reservation_url(@instance_reservation), params: { instance_reservation: { reservable_instance_id: @instance_reservation.reservable_instance_id, reservation_owner_id: @instance_reservation.reservation_owner_id } }
    assert_redirected_to instance_reservation_url(@instance_reservation)
  end

  test "should destroy instance_reservation" do
    assert_difference('InstanceReservation.count', -1) do
      delete instance_reservation_url(@instance_reservation)
    end

    assert_redirected_to instance_reservations_url
  end
end
