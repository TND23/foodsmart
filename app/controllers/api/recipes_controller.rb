module Api

	class RecipesController < ApiController

		before_filter :require_user


		def index
			@recipes = Recipe.search(params[:search])

		end

		def new
			@recipe = Recipe.new
		end

		def create
			@recipe = Recipe.new(recipe_params)
			@recipe.user_id = current_user.id
			if @recipe.save
				current_user.cookbook.add_recipe(@recipe.id)
				render :show
			else
				render :json => "One or more fields were not filled out"
			end
		end

		def edit
			
		end

		def update
			if @recipe.save
				render :show
			else
				render :json => "Updating failed"
			end
		end

		def destroy

		end

		def show
			@recipe = Recipe.find(params[:id])
		end


		private

		def recipe_params
			params.require(:recipes).permit(:user_id, :instructions, :dishname)
		end

	end
end