module RecipesHelper

	def find_by_ingredients(options = {}, *ingredients)
		#allow options to limit the number of recipes
		with_scope :find => options do
			@recipes = Recipe.find_all_by_ingredients(ingredients)
		end
	end

	def has_ingredient?(ingredient)

	end

	def recipe_tree

	end
	
end