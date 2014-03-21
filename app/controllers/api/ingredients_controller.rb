module Api

	class IngredientsController < ApiController
		before_filter :require_user

		def index
			@ingredients = Ingredient.all
		end

		def new
			
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
			
		end

		private 

		def ingredient_params
			params.require(:ingredient).permit(:name, :description)
		end
		
	end
end