class Cookbook < ActiveRecord::Base
	attr_accessible :notes, :user_id
	attr_reader :recipes
	has_and_belongs_to_many :recipes
	belongs_to :user
	validates :user_id, :presence => true

	def recipes
		@recipes ||= Recipe.find_by_cookbook_id(self.id)
	end
	
	def maintain
		#if a user deletes self, their referenced recipes are not deleted
	end

	def self.search_for_recipes

	end

	def annotate_recipe(recipe)

	end

	def add_recipe(recipe_id)
		@recipe = Recipe.find_by_id(params[:recipe_id])
		
	end
	
end
