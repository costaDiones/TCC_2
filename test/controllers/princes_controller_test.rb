require 'test_helper'

class PrincesControllerTest < ActionController::TestCase
  setup do
    @prince = princes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:princes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prince" do
    assert_difference('Prince.count') do
      post :create, prince: { valueAbove: @prince.valueAbove, valueNormal: @prince.valueNormal }
    end

    assert_redirected_to prince_path(assigns(:prince))
  end

  test "should show prince" do
    get :show, id: @prince
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prince
    assert_response :success
  end

  test "should update prince" do
    patch :update, id: @prince, prince: { valueAbove: @prince.valueAbove, valueNormal: @prince.valueNormal }
    assert_redirected_to prince_path(assigns(:prince))
  end

  test "should destroy prince" do
    assert_difference('Prince.count', -1) do
      delete :destroy, id: @prince
    end

    assert_redirected_to princes_path
  end
end
