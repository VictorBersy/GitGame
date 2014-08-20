class Users::OnBoardingController < ApplicationController
  def generate_token
    current_user.generate_token unless current_user.token
    @token = current_user.token
  end

  def select_repos
  end

  def start_playing
  end
end
