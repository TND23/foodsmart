module Api
	class CookbookRecipesController < ApiController

		def new
			@cookbook_recipe = CookbookRecipe.new
		end

		def index
			cookbook = Cookbook.find(params[:cookbook_id])
			@cookbook_recipes = cookbook.cookbook_recipes.all
			# @cookbook_recipes.each do |cr|
			# 	cr.recipe = Recipe.find(cr.recipe_id)
			# end
		end


		def create
			cookbook = current_user.cookbook
			recipe_id = params[:recipe][:id]

			@cookbook_recipe = cookbook.cookbook_recipes.new(recipe_id)				
				if @cookbook_recipe.save
				render :json => @cookbook_recipe
			else
				puts "5"
				render :json => "Error"
			end

		end

		def show
			@cookbook_recipe = CookbookRecipe.find(params[:id])
			if @cookbook_recipe.cookbook_id != current_user.cookbook.id
				render :json => "You sure that's yours?"
			end
		end

		def update
			@cookbook_recipe = CookbookRecipe.find(params[:id])
		end

		def destroy
			
			@cookbook_recipe = CookbookRecipe.find(params[:id])
		end

		private
		def cookbook_params
			params.require(:cookbook_recipes).permit(:cookbook_id, :recipe_id)
		end
	end
end

