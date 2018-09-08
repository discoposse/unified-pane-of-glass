require 'test_helper'

class ReservationOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation_owner = reservation_owners(:one)
  end

  test "should get index" do
    get reservation_owners_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_owner_url
    assert_response :success
  end

  test "should create reservation_owner" do
    assert_difference('ReservationOwner.count') do
      post reservation_owners_url, params: { reservation_owner: { email: @reservation_owner.email, firstname: @reservation_owner.firstname, lastname: @reservation_owner.lastname } }
    end

    assert_redirected_to reservation_owner_url(ReservationOwner.last)
  end

  test "should show reservation_owner" do
    get reservation_owner_url(@reservation_owner)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_owner_url(@reservation_owner)
    assert_response :success
  end

  test "should update reservation_owner" do
    patch reservation_owner_url(@reservation_owner), params: { reservation_owner: { email: @reservation_owner.email, firstname: @reservation_owner.firstname, lastname: @reservation_owner.lastname } }
    assert_redirected_to reservation_owner_url(@reservation_owner)
  end

  test "should destroy reservation_owner" do
    assert_difference('ReservationOwner.count', -1) do
      delete reservation_owner_url(@reservation_owner)
    end

    assert_redirected_to reservation_owners_url
  end
end
