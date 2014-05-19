module Api
	class RecipesController < ApiController
		before_filter :require_user
		skip_before_filter :verify_authenticity_token, :only => :create
		
		def index
			@recipes = Recipe.all
		end

		def new
			@recipe = Recipe.new
		end

		def create
			@recipe = Recipe.new(recipe_params)
			@recipe.recipe_ingredients.new(recipe_ingredient_params)	
			@recipe.user_id = current_user.id
			if @recipe.save
				current_user.cookbook.recipes << @recipe
				render :json => @recipe
			else
				flash.now[:errors] = @user.errors.full_messages
				render :new
			end
		end

		def update
			@recipe = Recipe.find(params[:id])
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
			params.require(:recipe).permit(:instructions, :dishname, :description)
		end

		def recipe_ingredient_params
			params.permit(:recipe_ingredients => [:quantity,:units, :optional, :name])
			.require(:recipe_ingredients)
			.values
			.reject{|data| data.values.any?(&:blank?)}
		end

		def _render(models)
			render :json => models
		end
		
	end
end

