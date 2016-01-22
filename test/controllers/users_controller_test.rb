require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get username" do
    get :username
    assert_response :success
  end

  test "should get password_digest" do
    get :password_digest
    assert_response :success
  end

  test "should get bio" do
    get :bio
    assert_response :success
  end

end
