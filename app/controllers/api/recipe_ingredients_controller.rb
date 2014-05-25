module Api
	class RecipeIngredientsController < ApiController

		def new
			@recipe_ingredient = RecipeIngredient.new
		end

		def index
			@recipe = Recipe.find(params[:recipe_id])
			@recipe_ingredients = @recipe.recipe_ingredients
		end

		def show

		end

		def destroy

		end

		def create
			@recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
#			@recipe_ingredients.ingredient.new(ingredient_params)
			@recipe_ingredient.ingredient_id = Ingredient.find_by_name(@recipe_ingredient.ingredient.name).id
			if @recipe_ingredient.save
				return 
			else
				render :json => "SHoot"
			end
		end

		def update

		end

		private

		def recipe_ingredient_params
			params.require(:recipe_ingredients).permit(:quantity,:units, :optional, :name)
		end

		# def ingredient_params
		# 	params.permit(:ingredients => [:name])
		# 	.require(:ingredients)
		# 	.values
		# 	.reject{|data| data.values.any?(&:blank?)}
		# end
		
	end
end

# module Api
# 	class RecipeIngredientsController < ApiController

# 		def new
# 			@recipe_ingredient = RecipeIngredient.new
# 		end

# 		def index
# 			@recipe = Recipe.find(params[:recipe_id])
# 			@recipe_ingredients = @recipe.recipe_ingredients
# 			@ingredients = @recipe.ingredients
# 		end

# 		def show

# 		end

# 		def destroy

# 		end

# 		def create
# 			@recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
# #			@recipe_ingredients.ingredient.new(ingredient_params)
# 			@ingredient = Ingredient.find_by_name(@recipe_ingredient.ingredient.name)
# 			@recipe_ingredient.ingredient_id = @ingredient.id
# 			@recipe_ingredients.name = @ingredient.name
# 			if @recipe_ingredient.save
# 				return 
# 			else
# 				render :json => "SHoot"
# 			end
# 		end

# 		def update

# 		end

# 		private

# 		def recipe_ingredient_params
# 			params.require(:recipe_ingredients).permit(:quantity,:units, :optional, :name)
# 		end

# 		# def ingredient_params
# 		# 	params.permit(:ingredients => [:name])
# 		# 	.require(:ingredients)
# 		# 	.values
# 		# 	.reject{|data| data.values.any?(&:blank?)}
# 		# end
		
# 	end
# end