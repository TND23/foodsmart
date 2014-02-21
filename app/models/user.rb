class User < ActiveRecord::Base
	#convert to omniauth ?
	attr_accessible :username, :password
	
    has_many :endorsements
    has_many :recipes
    has_one :cookbook

    def self.find_by_credentials(username, password)
    	user = User.find_by username
    	return nil if user.nil?
    end

    def self.generate_session_token
    	SecureRandom::urlsafe_base64(16)
    end

    def password=(password)
    	@password = password
    	self.password_digest = BCrypt::Password.new(password)
    end


end