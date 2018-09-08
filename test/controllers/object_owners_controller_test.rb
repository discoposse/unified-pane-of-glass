require 'test_helper'

class ObjectOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @object_owner = object_owners(:one)
  end

  test "should get index" do
    get object_owners_url
    assert_response :success
  end

  test "should get new" do
    get new_object_owner_url
    assert_response :success
  end

  test "should create object_owner" do
    assert_difference('ObjectOwner.count') do
      post object_owners_url, params: { object_owner: { email: @object_owner.email, firstname: @object_owner.firstname, lastname: @object_owner.lastname } }
    end

    assert_redirected_to object_owner_url(ObjectOwner.last)
  end

  test "should show object_owner" do
    get object_owner_url(@object_owner)
    assert_response :success
  end

  test "should get edit" do
    get edit_object_owner_url(@object_owner)
    assert_response :success
  end

  test "should update object_owner" do
    patch object_owner_url(@object_owner), params: { object_owner: { email: @object_owner.email, firstname: @object_owner.firstname, lastname: @object_owner.lastname } }
    assert_redirected_to object_owner_url(@object_owner)
  end

  test "should destroy object_owner" do
    assert_difference('ObjectOwner.count', -1) do
      delete object_owner_url(@object_owner)
    end

    assert_redirected_to object_owners_url
  end
end
