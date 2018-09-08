require 'test_helper'

class ReservableInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservable_instance = reservable_instances(:one)
  end

  test "should get index" do
    get reservable_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_reservable_instance_url
    assert_response :success
  end

  test "should create reservable_instance" do
    assert_difference('ReservableInstance.count') do
      post reservable_instances_url, params: { reservable_instance: { name: @reservable_instance.name, vm: @reservable_instance.vm } }
    end

    assert_redirected_to reservable_instance_url(ReservableInstance.last)
  end

  test "should show reservable_instance" do
    get reservable_instance_url(@reservable_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservable_instance_url(@reservable_instance)
    assert_response :success
  end

  test "should update reservable_instance" do
    patch reservable_instance_url(@reservable_instance), params: { reservable_instance: { name: @reservable_instance.name, vm: @reservable_instance.vm } }
    assert_redirected_to reservable_instance_url(@reservable_instance)
  end

  test "should destroy reservable_instance" do
    assert_difference('ReservableInstance.count', -1) do
      delete reservable_instance_url(@reservable_instance)
    end

    assert_redirected_to reservable_instances_url
  end
end
