class Recipe < ActiveRecord::Base
	attr_accessible :dishname, :description, :ingredients, :instructions, :recipe_ingredients
	attr_accessor :cookbook_id

	validates :instructions, :presence => true
	validates :user_id, :presence => true
	validates :ingredients, :null => false
	
	belongs_to :user

	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients

	has_many :recipe_utensils
	has_many :utensils, :through => :recipe_utensils

	has_many :cookbook_recipes
	has_many :cookbooks, :through => :cookbook_recipes

	has_many :endorsements

	accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true

	def calculate_rating
		endorsements = self.endorsements
		return "No data" if endorsements.nil?
		self.rating = Endorsement.weigh_averages(endorsements)
	end

	# def add_ingredients(*ingredients)
	# 	ingredients.each do |ingredient|
	# 		if Ingredient.find_by_id(ingredient.id).nil?
	# 			puts "No such ingredient exists"
	# 		elsif
	# 			self.ingredients.include?(ingredient)
	# 			puts "That's already in the recipe"
	# 		else
	# 			self.ingredients << ingredient
	# 		end
	# 	end
	# end

	# def add_ingredient_by_name(name)
	# 	ingredient = Ingredient.find_by_name(name)
	# 	add_ingredients(ingredient)
	# end

	# 	def add_ingredients(ingredient)
	# 	self.ingredients << ingredient
	# end

	# def add_ingredient_by_name(name)
	# 	if name == ''
	# 		return nil
	# 	end
	# 	ingredient = Ingredient.find_by_name(name)
	# 	add_ingredients(ingredient)
	# end

	def remove_ingredients(*ingredients)
		ingredients.each do |ingredient|
			if Ingredient.find_by_id(ingredient.id).nil?
				return "No such ingredient exists"
			elsif
				!self.ingredients.include?(ingredient)
				return "That's not in the recipe"
			else
				self.ingredients.delete(ingredient)
			end
		end
	end

	def self.filter_by_ingredients(*ingredients)
		# options: find recipes that are in stock for a user
		# filter by rating
	end

	def self.search(search)
		if search && !search.empty?
			find(:all, :conditions => ['dishname LIKE ?', "#{search}"])
		else
			find(:all)
		end
	end

	# publish all recipes in a global place that is searchable

	def send_to_deleted_user
		#if user deletes self, the recipe is sent to "deleted_user"
	end

	def add_endorsement(endorsement)
		self.endorsements << endorsement
	end

	private

	def send_to_owners_cookbook
		self.cookbook_id = current_user.cookbook.id if current_user
	end

end