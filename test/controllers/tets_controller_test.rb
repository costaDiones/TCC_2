require 'test_helper'

class TetsControllerTest < ActionController::TestCase
  setup do
    @tet = tets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tet" do
    assert_difference('Tet.count') do
      post :create, tet: { User_id: @tet.User_id, description: @tet.description, title: @tet.title }
    end

    assert_redirected_to tet_path(assigns(:tet))
  end

  test "should show tet" do
    get :show, id: @tet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tet
    assert_response :success
  end

  test "should update tet" do
    patch :update, id: @tet, tet: { User_id: @tet.User_id, description: @tet.description, title: @tet.title }
    assert_redirected_to tet_path(assigns(:tet))
  end

  test "should destroy tet" do
    assert_difference('Tet.count', -1) do
      delete :destroy, id: @tet
    end

    assert_redirected_to tets_path
  end
end
