class User < ActiveRecord::Base
	#convert to omniauth ?

	attr_accessible :username, :password
	attr_reader :password
	validates :password_digest, :presence => { :message => "Password can't be blank" }
	validates :password, :length => { :minimum => 6}
  # validates_confirmation_of :password
	# validates :password_confirmation, :presence => true
	# validate username has only letters and numbers
	validates :username, format: {without: /\s|\$|[<>,@!&:;{}()"+=#%\?\.\^\*\|]/, on: :create}
	validates :username, :length => {:maximum => 15}
  validates :session_token, :presence => true
	validates :username, :presence => true
	validates :username, :uniqueness => true
  before_create :ensure_cookbook_id
	after_initialize :ensure_session_token
  has_many :endorsements, :dependent => :destroy
  has_many :recipes, :through => :cookbook, :source => :recipe
  has_and_belongs_to_many :ingredients
  has_one :cookbook, :dependent => :destroy


#   ---------- session and authenticity ------------
  def self.find_by_credentials(username, password)
  	user = User.find_by username
  	if user && user.password_digest == BCrypt::Password.new(user.password_digest).is_password?(password)
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

#--------- recipe logic ---------------

  def edit_recipe(recipe)
      # if self.has_permission
      #check if user has permission
  end

  def endorse_recipe(recipe)
    
  end

  def favorite_recipe(recipe)
    
  end

  def give_permission(user, recipe)

  end

  def create_recipe

  end

  def submit_recipe

  end

#------- management logic -------------

  def remove_ingredients(ingredient)

  end

  def add_ingredient_to_stock(ingredient)

  end

  def convert_ingredients(from, to)

  end

  private
#--------- private logic ---------------
  

  def reset_session_token
  	self.session_token = SecureRandom::urlsafe_base64(16)
  	self.save!
  end

  def ensure_session_token
  	self.session_token ||= self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def ensure_cookbook_id
    return self.cookbook_id unless self.cookbook_id.nil?
    cookbook = Cookbook.new(:user_id => self.id)
    cookbook.save
    self.cookbook_id = cookbook.id
  end

end