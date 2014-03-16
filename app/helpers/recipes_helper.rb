module RecipesHelper

	OPTIONS = {by_rating, by_ingredients, by_difficulty, by_time, by_type}

	def find_by_ingredients(options = {}, *ingredients)
		#allow options to limit the number of recipes
		with_scope :find => options do
			@recipes = Recipe.find_all_by_ingredients(ingredients)
		end
	end

	def set_filter_options(options = {})
		
	end
	
end