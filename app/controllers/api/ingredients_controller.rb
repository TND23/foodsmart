module Api

	class IngredientsController < ApiController
		before_filter :require_user
		#uncomment for production
		#before_filter :require_admin, :only => :create, :update

		def index
			@ingredients = Ingredient.all
			render "api/ingredients/index"
		end

		def new	
			@ingredients = Ingredient.all
		end

		def create
			@ingredient = Ingredient.create(ingredient_params)
			if @ingredient.save
				redirect_to api_ingredients_url
			else
				flash[:notice] = "Something gone wrong"
				redirect_to api_ingredients_url
			end
		end

		def edit
			
		end

		def show
			@ingredient = Ingredient.find(params[:id])
			render "api/ingredients/show"
		end

		private 

		def ingredient_params
			params.require(:ingredient).permit(:name, :description)
		end
		
	end
end