require 'test_helper'

class HydrometersControllerTest < ActionController::TestCase
  setup do
    @hydrometer = hydrometers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hydrometers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hydrometer" do
    assert_difference('Hydrometer.count') do
      post :create, hydrometer: { user_id: @hydrometer.user_id }
    end

    assert_redirected_to hydrometer_path(assigns(:hydrometer))
  end

  test "should show hydrometer" do
    get :show, id: @hydrometer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hydrometer
    assert_response :success
  end

  test "should update hydrometer" do
    patch :update, id: @hydrometer, hydrometer: { user_id: @hydrometer.user_id }
    assert_redirected_to hydrometer_path(assigns(:hydrometer))
  end

  test "should destroy hydrometer" do
    assert_difference('Hydrometer.count', -1) do
      delete :destroy, id: @hydrometer
    end

    assert_redirected_to hydrometers_path
  end
end
