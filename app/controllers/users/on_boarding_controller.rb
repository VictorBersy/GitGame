class Users::OnBoardingController < ApplicationController
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
    webhook_url = "#{root_url}/webhook/github/"
    Octokit.create_hook(repository_name, 'web',
      {
        :url => webhook_url,
        :content_type => 'json'
      },
      {
        :events => ['*'],
        :active => true
      }
    )
  end
end
