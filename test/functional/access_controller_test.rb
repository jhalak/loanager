require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
