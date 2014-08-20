require 'test_helper'

class Users::OnBoardingControllerTest < ActionController::TestCase
  test "should get generateToken" do
    get :generateToken
    assert_response :success
  end

  test "should get selectRepos" do
    get :selectRepos
    assert_response :success
  end

  test "should get startPlaying" do
    get :startPlaying
    assert_response :success
  end

end
