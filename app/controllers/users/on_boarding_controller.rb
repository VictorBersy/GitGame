class Users::OnBoardingController < ApplicationController
  def generate_gitgame_token
    current_user.generate_gitgame_token unless current_user.gitgame_token
    @gitgame_token = current_user.gitgame_token
  end

  def select_repos
  end

  def start_playing
  end
end
