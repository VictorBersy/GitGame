class Users::ProfileController < ApplicationController
  before_action :retrieve_user
  def show
  end

  private

  def retrieve_user
    @user = User.find_by_username(params[:name].parameterize)
  end
end
