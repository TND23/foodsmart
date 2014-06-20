module Api
	class RecipesController < ApiController
		before_filter :require_user
		skip_before_filter :verify_authenticity_token, :only => :create
		before_filter :default_format_html, :only => :index

		def index
			# select all recipes where the name is like the paramter searched for
			@recipes = Recipe.paginate(:page => params[:page], :per_page => 25)
		  .where("dishname LIKE ?", "%#{dishname_key}%")
			count = Recipe.count
			render :index, :layout => false
		end

		def new
			@recipe = Recipe.new
		end

		def create
			@recipe = Recipe.new(recipe_params)
			@recipe.recipe_ingredients.new(recipe_ingredient_params)	
			@recipe.user_id = current_user.id
			if @recipe.save
				create_new_cookbook_recipe(@recipe)
				current_user.cookbook.recipes << @recipe
				redirect_to "/#recipes/page/1"
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

		def names
			name = params[:name]
			@recipes = Recipe.where("dishname like ?", "%#{name}%").pluck(:dishname)
			render :json => @recipes
		end

		def show
			@recipe = Recipe.find(params[:id])
			@recipe_ingredients = @recipe.recipe_ingredients
		end

		private

		def dishname_key
			params[:dishname].try(:downcase)
		end

		def recipe_params
			params.require(:recipe).permit(:instructions, :dishname, :description)
		end

		def recipe_ingredient_params
			params.permit(:recipe_ingredients => [:quantity,:units, :optional, :name])
			.require(:recipe_ingredients)
			.values
			.reject{|data| data.values.any?(&:blank?)}
		end

		def default_format_html
			request.format = "html"
		end

		def create_new_cookbook_recipe(recipe)
			cbRecipe = CookbookRecipe.new()
			cbRecipe.recipe_id = recipe.id
			cbRecipe.cookbook_id = current_user.cookbook.id
		end
		
	end
end