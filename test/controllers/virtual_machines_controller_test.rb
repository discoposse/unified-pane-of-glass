require 'test_helper'

class VirtualMachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virtual_machine = virtual_machines(:one)
  end

  test "should get index" do
    get virtual_machines_url
    assert_response :success
  end

  test "should get new" do
    get new_virtual_machine_url
    assert_response :success
  end

  test "should create virtual_machine" do
    assert_difference('VirtualMachine.count') do
      post virtual_machines_url, params: { virtual_machine: {  } }
    end

    assert_redirected_to virtual_machine_url(VirtualMachine.last)
  end

  test "should show virtual_machine" do
    get virtual_machine_url(@virtual_machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_virtual_machine_url(@virtual_machine)
    assert_response :success
  end

  test "should update virtual_machine" do
    patch virtual_machine_url(@virtual_machine), params: { virtual_machine: {  } }
    assert_redirected_to virtual_machine_url(@virtual_machine)
  end

  test "should destroy virtual_machine" do
    assert_difference('VirtualMachine.count', -1) do
      delete virtual_machine_url(@virtual_machine)
    end

    assert_redirected_to virtual_machines_url
  end
end
