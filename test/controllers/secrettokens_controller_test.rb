require 'test_helper'

class SecrettokensControllerTest < ActionController::TestCase
  setup do
    @secrettoken = secrettokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:secrettokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create secrettoken" do
    assert_difference('Secrettoken.count') do
      post :create, secrettoken: { code: @secrettoken.code }
    end

    assert_redirected_to secrettoken_path(assigns(:secrettoken))
  end

  test "should show secrettoken" do
    get :show, id: @secrettoken
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @secrettoken
    assert_response :success
  end

  test "should update secrettoken" do
    patch :update, id: @secrettoken, secrettoken: { code: @secrettoken.code }
    assert_redirected_to secrettoken_path(assigns(:secrettoken))
  end

  test "should destroy secrettoken" do
    assert_difference('Secrettoken.count', -1) do
      delete :destroy, id: @secrettoken
    end

    assert_redirected_to secrettokens_path
  end
end
