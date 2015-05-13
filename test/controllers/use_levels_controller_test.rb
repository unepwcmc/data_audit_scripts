require 'test_helper'

class UseLevelsControllerTest < ActionController::TestCase
  setup do
    @use_level = use_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:use_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create use_level" do
    assert_difference('UseLevel.count') do
      post :create, use_level: { name: @use_level.name }
    end

    assert_redirected_to use_level_path(assigns(:use_level))
  end

  test "should show use_level" do
    get :show, id: @use_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @use_level
    assert_response :success
  end

  test "should update use_level" do
    patch :update, id: @use_level, use_level: { name: @use_level.name }
    assert_redirected_to use_level_path(assigns(:use_level))
  end

  test "should destroy use_level" do
    assert_difference('UseLevel.count', -1) do
      delete :destroy, id: @use_level
    end

    assert_redirected_to use_levels_path
  end
end
