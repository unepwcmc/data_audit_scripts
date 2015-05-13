require 'test_helper'

class DatasetScopesControllerTest < ActionController::TestCase
  setup do
    @dataset_scope = dataset_scopes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_scopes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_scope" do
    assert_difference('DatasetScope.count') do
      post :create, dataset_scope: { name: @dataset_scope.name }
    end

    assert_redirected_to dataset_scope_path(assigns(:dataset_scope))
  end

  test "should show dataset_scope" do
    get :show, id: @dataset_scope
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_scope
    assert_response :success
  end

  test "should update dataset_scope" do
    patch :update, id: @dataset_scope, dataset_scope: { name: @dataset_scope.name }
    assert_redirected_to dataset_scope_path(assigns(:dataset_scope))
  end

  test "should destroy dataset_scope" do
    assert_difference('DatasetScope.count', -1) do
      delete :destroy, id: @dataset_scope
    end

    assert_redirected_to dataset_scopes_path
  end
end
