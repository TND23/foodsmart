module Api
	class RecipesController < ApiController
		before_filter :require_user
		skip_before_filter :verify_authenticity_token, :only => :create

		def index
			# @recipes = Recipe.search(params[:search])
			@recipes = Recipe.all
			@recipes.each do |recipe|
				recipe.recipe_ingredients.each do |ri|
					if !ri.name
						ri.name = ri.ingredient.name
					end
					if !ri.description
						ri.description = ri.ingredient.description
					end
				end
			end
			render "api/recipes/index"
		end

		def new
			@recipe = Recipe.new
			render "api/recipes/new.html.erb"
			
		end

		def create
			@recipe = Recipe.new(recipe_params)
			@recipe.user_id = current_user.id
			if @recipe.save
				current_user.cookbook.cookbook_recipes << @recipe
				render :show
			else
				render :json => "Could not create recipe: controller failure"
			end
		end

		def update
			if @recipe.save
				render :show
			else
				render :json => "Updating failed: controller"
			end
		end

		def destroy
		end

		def show
			@recipe = Recipe.find(params[:id])
			render "api/recipes/show"
		end

		private
		def recipe_params
			#if recipe is defined we fetch it, otherwise set default value to {}
			params.fetch(:recipe, {}).permit(
				:instructions, 
				:dishname, 
				:description,
				:recipe_ingredient_attributes => [
					:quantity,
					:optional,
					:ingredient_attributes => [:name]
				]
			)
		end

		def _render(models)
			render :json => models
		end
		
	end
end

