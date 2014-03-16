class Recipe < ActiveRecord::Base

	attr_accessible :ingredients, :utensils
	attr_reader :cookbooks
	validates :instructions, :presence => true
	validates :user_id, :presence => true
	validates :ingredients, :null => false
	belongs_to :user
	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :utensils
	has_and_belongs_to_many :cookbooks #in case of collaborative recipe
	has_many :endorsements

	def calculate_rating
		endorsements = self.endorsements
		return "No data" if endorsements.nil?
		self.average_rating = Endorsement.weigh_averages(endorsements)
	end

	def add_ingredients(*ingredients)
		ingredients.each do |ingredient|
			if Ingredient.find_by_id(ingredient.id).nil?
				puts "No such ingredient exists"
			elsif
				self.ingredients.include?(ingredient)
				puts "That's already in the recipe"
			else
				self.ingredients << ingredient
			end
		end
	end

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

	def self.filter_by_ingredients

	end

	def send_to_deleted_user
		#if user deletes self, the recipe is sent to "deleted_user"
	end

	def author

	end

end

	# Refactoring

	# def iterate_throgh_ingredients(*ingredients, str1)
	# 	ingredients.each do |ingredient|
	# 		if Ingredient.find_by_id(ingredient.id).nil?
	# 			return str1
	# 		elsif self.ingredients.include?(ingredient)
	# 			return true
	# 		end
	# 	end
	# end

	# def add_ingredient(*ingredients)
	# 	iterate_throgh_ingredients ingredients, "No such ingredient exists"
			
	# 		elsif
	# 			self.ingredients.include?(ingredient)
	# 			return "That's already in the recipe"
	# 		else
	# 			self.ingredients << ingredient
	# 	end
	# end

	# def remove_ingredients(*ingredients)
	# 	iterate_throgh_ingredients ingredients, "No such ingredient exists"
	# 		elsif
	# 			self.ingredients.include?(ingredient)
	# 			return "That's already in the recipe"
	# 		else
	# 			self.ingredients << ingredient
	# 	end
	# end