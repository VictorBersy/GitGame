class Users::OnBoardingController < ApplicationController
  def generate_gitgame_token
    current_user.generate_gitgame_token unless current_user.gitgame_token
    @gitgame_token = current_user.gitgame_token
  end

  def select_repos
    @repositories = Octokit.repositories
  end

  def start_playing
    @selected_repositories = params[:repositories]
    @selected_repositories.keys.each do |repository_name|
      create_webhook(repository_name)
    end
  end

  private

  def create_webhook(repository_name)
    puts repository_name
    puts "#{GITGAME_CONFIG['webhook_url']}/webhook/github/"
=begin
    Octokit.create_hook(repository_name, 'web',
      {
        :url => "#{root_url}/webhook/github/",
        :content_type => 'json'
      },
      {
        :events => ['*'],
        :active => true
      }
    )
=end
  end
end
