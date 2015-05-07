require 'test_helper'

class DrivesControllerTest < ActionController::TestCase
  setup do
    @drife = drives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drife" do
    assert_difference('Drive.count') do
      post :create, drife: { name: @drife.name }
    end

    assert_redirected_to drife_path(assigns(:drife))
  end

  test "should show drife" do
    get :show, id: @drife
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drife
    assert_response :success
  end

  test "should update drife" do
    patch :update, id: @drife, drife: { name: @drife.name }
    assert_redirected_to drife_path(assigns(:drife))
  end

  test "should destroy drife" do
    assert_difference('Drive.count', -1) do
      delete :destroy, id: @drife
    end

    assert_redirected_to drives_path
  end
end
