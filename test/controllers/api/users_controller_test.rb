require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_users_create_url
    assert_response :success
  end

  test "should get update" do
    get api_users_update_url
    assert_response :success
  end

end
