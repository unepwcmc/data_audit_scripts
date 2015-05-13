require 'test_helper'

class DatasetFormatsControllerTest < ActionController::TestCase
  setup do
    @dataset_format = dataset_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_format" do
    assert_difference('DatasetFormat.count') do
      post :create, dataset_format: { name: @dataset_format.name }
    end

    assert_redirected_to dataset_format_path(assigns(:dataset_format))
  end

  test "should show dataset_format" do
    get :show, id: @dataset_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_format
    assert_response :success
  end

  test "should update dataset_format" do
    patch :update, id: @dataset_format, dataset_format: { name: @dataset_format.name }
    assert_redirected_to dataset_format_path(assigns(:dataset_format))
  end

  test "should destroy dataset_format" do
    assert_difference('DatasetFormat.count', -1) do
      delete :destroy, id: @dataset_format
    end

    assert_redirected_to dataset_formats_path
  end
end
