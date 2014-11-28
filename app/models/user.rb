class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
          :trackable, :validatable, :omniauthable,
          :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email          = auth.info.email
      user.password       = Devise.friendly_token[0,20]
      user.screen_name    = auth.info.nickname
      user.username       = auth.info.nickname.parameterize
      user.image          = auth.info.image
      user.github_token   = auth.credentials.token
      user.github_user_id = auth.uid
    end
  end

  def configure_octokit
    Octokit.configure do |config|
      config.access_token = self.github_token
    end
  end
end
