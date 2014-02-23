class User < ActiveRecord::Base
	#convert to omniauth ?

	attr_accessible :username, :password, :cookbook
	attr_reader :password
	
	validates :password_digest, :presence => { :message => "Password can't be blank" }
	validates :password, :length => { :minimum => 6}
	# add password confirmation
	# validates :password, :confirmation => true
	# validates :password_confirmation, :presence => true

	# validate username has only letters and numbers
	validates :username, format: {with: /\w+|\d+/}
	validates :session_token, :presence => true
	validates :username, :presence => true
	validates :username, :uniqueness => true
	after_initialize :ensure_session_token

    has_many :endorsements
    has_many :recipes
    has_one :cookbook

    def self.find_by_credentials(username, password)
    	user = User.find_by username
    	if user && user.password_digest == BCrypt::Password.new(self.password_digest).is_password?(password)
    		user
    	else
    		nil
    	end
    end

    def password=(password)
    	@password = password
    	self.password_digest = BCrypt::Password.create(password)
    end

    def check_password(password)
    	#use BCrypt is_password?() method
    	BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def edit_recipe

    end

    def submit_recipe

    end

    def endorse_recipe

    end

    private

    def reset_session_token
    	self.session_token = SecureRandom::urlsafe_base64(16)
    	self.save!
    end

    def ensure_session_token
    	self.session_token ||= self.session_token = SecureRandom::urlsafe_base64(16)
    end

end