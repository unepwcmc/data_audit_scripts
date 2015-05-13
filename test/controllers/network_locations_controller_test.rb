require 'test_helper'

class NetworkLocationsControllerTest < ActionController::TestCase
  setup do
    @network_location = network_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_location" do
    assert_difference('NetworkLocation.count') do
      post :create, network_location: { drive_id: @network_location.drive_id, path: @network_location.path }
    end

    assert_redirected_to network_location_path(assigns(:network_location))
  end

  test "should show network_location" do
    get :show, id: @network_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_location
    assert_response :success
  end

  test "should update network_location" do
    patch :update, id: @network_location, network_location: { drive_id: @network_location.drive_id, path: @network_location.path }
    assert_redirected_to network_location_path(assigns(:network_location))
  end

  test "should destroy network_location" do
    assert_difference('NetworkLocation.count', -1) do
      delete :destroy, id: @network_location
    end

    assert_redirected_to network_locations_path
  end
end
