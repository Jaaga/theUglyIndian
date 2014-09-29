class User < ActiveRecord::Base
	
	after_save :assign_username

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.oauth_token = auth.credentials.token
        user.save!
        return user
    end
  end

  private

  def assign_username
  	self.update_attributes(username: "tui#{id}")
  end

end
