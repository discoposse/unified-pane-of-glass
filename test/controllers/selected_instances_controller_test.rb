require 'test_helper'

class SelectedInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selected_instance = selected_instances(:one)
  end

  test "should get index" do
    get selected_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_selected_instance_url
    assert_response :success
  end

  test "should create selected_instance" do
    assert_difference('SelectedInstance.count') do
      post selected_instances_url, params: { selected_instance: {  } }
    end

    assert_redirected_to selected_instance_url(SelectedInstance.last)
  end

  test "should show selected_instance" do
    get selected_instance_url(@selected_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_selected_instance_url(@selected_instance)
    assert_response :success
  end

  test "should update selected_instance" do
    patch selected_instance_url(@selected_instance), params: { selected_instance: {  } }
    assert_redirected_to selected_instance_url(@selected_instance)
  end

  test "should destroy selected_instance" do
    assert_difference('SelectedInstance.count', -1) do
      delete selected_instance_url(@selected_instance)
    end

    assert_redirected_to selected_instances_url
  end
end
