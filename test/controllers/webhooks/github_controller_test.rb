require 'test_helper'

class Webhooks::GithubControllerTest < ActionController::TestCase
  test "should get receive" do
    get :receive
    assert_response :success
  end

end
