class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
          :trackable, :validatable, :omniauthable,
          :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name     = auth.info.nickname
      user.image    = auth.info.image
    end
  end

  private

  def self.generate_token
    begin
      token = SecureRandom.hex
    end while self.exists?(token: token)
    token
  end
end
