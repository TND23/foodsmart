class User < ActiveRecord::Base

	attr_accessible :username, :password
	attr_reader :password
  
  after_initialize :ensure_session_token
  before_validation :ensure_session_token
  validates :session_token, :presence => true
  # validate username has only letters and numbers
	validates :username, format: {without: /\s|\$|[<>,@!&:;{}()"+=#%\?\.\^\*\|]/, on: :create}
	validates :username, :length => {:maximum => 15}
	validates :username, :presence => true
	validates :username, :uniqueness => true
  validates :password, :length => { :minimum => 6}
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates_confirmation_of :password

  has_many :endorsements, :dependent => :destroy
  has_many :user_ingredients
  has_many :ingredients, :through => :user_ingredients
  has_one :cookbook, :dependent => :destroy
  # that they have authored
  has_many :recipes

  def self.find_by_credentials(username, password)
   user = User.find_by_username(username)
   return nil if user.nil?
   user.is_password?(password) ? user : nil
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end


  def has_permission?(recipe)
    return true if recipe.user_id = self.id
  end

 def is_password?(password)
   BCrypt::Password.new(self.password_digest).is_password?(password)
 end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  private
  def ensure_session_token
  	self.session_token ||= self.session_token = SecureRandom::urlsafe_base64(16)
  end

end