class User < ActiveRecord::Base

	attr_accessible :username, :password
	attr_reader :password
	validates :password_digest, :presence => { :message => "Password can't be blank" }
  before_validation :ensure_session_token

	# validate username has only letters and numbers
	validates :username, format: {without: /\s|\$|[<>,@!&:;{}()"+=#%\?\.\^\*\|]/, on: :create}
	validates :username, :length => {:maximum => 15}
  validates :session_token, :presence => true
	validates :username, :presence => true
	validates :username, :uniqueness => true
  validates :password, :length => { :minimum => 6}
  validates_confirmation_of :password

	after_initialize :ensure_session_token
  has_many :endorsements, :dependent => :destroy

  has_many :user_ingredients
  has_many :ingredients, :through => :user_ingredients
  
  has_one :cookbook, :dependent => :destroy
  has_many :recipes

  def self.find_by_credentials(username, password)
  	user = User.find_by_username username
  	if user && user.password_digest == BCrypt::Password.new(user.password_digest)
  	 return	user
  	else
  		return nil
  	end
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

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
    favorited_recipes ||= self.cookbook.saved_recipes
    if favorited_recipes.nil?
      favorited_recipes = {}
    elsif
      favorited_recipes[recipe.dish_name]
      puts "would you like to replace #{recipe.dish_name} with a new version?"
    else
      favorited_recipes[recipe.dish_name] = recipe.id
    end
  end

  def remove_ingredients(ingredient)
    if self.ingredients.find(ingredient.id).nil? 
      puts "You don't have #{ingredient}"
    else
      self.ingredients.delete(ingredient)
    end
  end

  def add_ingredient_to_stock(ingredient, quantity, units)
    ingredient = Ingredient.find(ingredient.id)
    if ingredient.nil?
      puts "No such ingredient exists"
    elsif self.ingredients.include?(ingredient)
      puts "You've already go #{ingredient}"
    else
      self.ingredients << ingredient
    end
  end

  def add_user_ingredient(ingredient, quantity, units)

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