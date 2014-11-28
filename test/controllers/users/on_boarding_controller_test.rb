require 'test_helper'

class Users::OnBoardingControllerTest < ActionController::TestCase
  test "should get select_repos" do
    get :select_repos
    assert_response :success
  end

  test "should get start_playing" do
    get :start_playing
    assert_response :success
  end
end
