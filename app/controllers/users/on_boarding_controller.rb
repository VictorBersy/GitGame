class Users::OnBoardingController < ApplicationController
  def generate_token
    @token = current_user.generate_token
  end

  def select_repos
  end

  def start_playing
  end
end
