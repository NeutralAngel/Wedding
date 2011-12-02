require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get wedding" do
    get :wedding
    assert_response :success
  end

  test "should get reception" do
    get :reception
    assert_response :success
  end

  test "should get registry" do
    get :registry
    assert_response :success
  end

  test "should get honeymoon" do
    get :honeymoon
    assert_response :success
  end

end
