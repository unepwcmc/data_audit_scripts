require 'test_helper'

class ImportanceLevelsControllerTest < ActionController::TestCase
  setup do
    @importance_level = importance_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:importance_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create importance_level" do
    assert_difference('ImportanceLevel.count') do
      post :create, importance_level: { name: @importance_level.name }
    end

    assert_redirected_to importance_level_path(assigns(:importance_level))
  end

  test "should show importance_level" do
    get :show, id: @importance_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @importance_level
    assert_response :success
  end

  test "should update importance_level" do
    patch :update, id: @importance_level, importance_level: { name: @importance_level.name }
    assert_redirected_to importance_level_path(assigns(:importance_level))
  end

  test "should destroy importance_level" do
    assert_difference('ImportanceLevel.count', -1) do
      delete :destroy, id: @importance_level
    end

    assert_redirected_to importance_levels_path
  end
end
