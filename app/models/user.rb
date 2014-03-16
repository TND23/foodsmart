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

  # this should be in the controller
  def edit_recipe(recipe)
    return false unless self.has_permission?(recipe)

      # if self.has_permission
      #check if user has permission
  end

  def endorse_recipe(recipe, comments, stars)
    #if exists or is own recipe
    if recipe.nil? || recipe.user_id = self.id
      return false
      #if already endorsed
    elsif !recipe.endorsements.find_by_user_id(self.id).nil?
      return false
    else
      endorsement = Endorsement.new(
        :user_id => self.id, 
        :comments => comments, 
        :stars => stars,
        :recipe_id => recipe.id
      )
      recipe.add_endorsement(endorsement)
      endorsement.save!
    end
  end

  def has_permission?(recipe)
    return true if recipe.user_id = self.id
  end

  def favorite_recipe(recipe)
    favorited_recipes = self.cookbook.saved_recipes
    if favorited_recipes.nil?
      favorited_recipes = {}
    elsif
      favorited_recipes[recipe.dish_name]
      puts "would you like to replace #{recipe.dish_name} with a new version?"
    else
      favorited_recipes[recipe.dish_name] = recipe.id
    end
  end

  def give_permission(user, recipe)

  end

  def create_recipe

  end

  def submit_recipe

  end

#------- management logic -------------

  def remove_ingredients(ingredient)
    if self.ingredients.find(ingredient.id).nil? 
      puts "You don't have #{ingredient}"
    else
      self.ingredients.delete(ingredient)
    end
  end

  def add_ingredient_to_stock(ingredient)
    ingredient = Ingredient.find(ingredient.id)
    if ingredient.nil?
      puts "No such ingredient exists"
    elsif self.ingredients.include?(ingredient)
      puts "You've already go #{ingredient}"
    else
      self.ingredients << ingredient
    end
  end

  def convert_ingredients(from, to)
    #for instance, berries + sugar + lemon juice goes in the from, berry puree goes into the to
    
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