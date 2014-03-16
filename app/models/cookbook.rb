class Cookbook < ActiveRecord::Base
	attr_accessible :notes, :user_id
	has_and_belongs_to_many :recipes
	belongs_to :user
	validates :user_id, :presence => true

	def recipes
		# return "No recipes" if self.recipes.nil?
		# @recipes ||= Recipe.find_by_cookbook_id(self.id)
	end
	
	def maintain
		#if a user deletes self, their referenced recipes are not deleted
	end

	def search_for_recipes_by_name(dish)
		#searches in own cookbook
	end

	def search_for_recipes_by_ingredients(*ingredients)
		#searches in own cookbook
	end

	def annotate_recipe(recipe)
		#should comments have an associated recipe? 
		#how can this be formatted?
	end

	def add_recipe(recipe_id)
		if !self.recipes.nil?
			self.recipes.each do |recipe|
				if recipe.id == recipe_id
					puts "You've already got that one!"
					return false
				end
			end
		end
		if Recipe.find(recipe_id).nil?
			puts "Sorry, we couldn't find the recipe."
		else
			recipe = Recipe.find_by_id(recipe_id)
			self.recipes << recipe
		end
	end

	def remove_recipe(recipe_id)
		#removes recipe from own cookbook
	end
	
end
