class Webhooks::GithubController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def receive
  end
end
