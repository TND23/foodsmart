module RecipesHelper

	def find_by_ingredients(*ingredients)
		@recipes = Recipe.find_all_by_ingredients(ingredients)
	end

	def has_ingredient?(ingredient)

	end
	
end