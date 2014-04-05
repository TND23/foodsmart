module Api
	class UserIngredientsController < ApiController
		before_filter :require_user

		def index
			@user_ingredients = current_user.user_ingredients.all	
			render "api/user_ingredients/index"
		end

		def create
			@user_ingredient = UserIngredient.new(params[:user_ingredient])
			ingredient = Ingredient.find_by_name(@user_ingredient.name)
			
			if ingredient == nil || @user_ingredient.quantity.class != Float || @user_ingredient.units.class == nil
				render :json => {:errors => @user_ingredient.errors.full_messages }
			else
				@user_ingredient.ingredient_id = ingredient.id
				@user_ingredient.user_id = current_user.id
				if @user_ingredient.save
					render :new
				else
					render :json => "Mystery error"
				end
			end
		end

		def destroy
			@user_ingredient = UserIngredient.where(:user_id => current_user.id, :name => params[:name])
		end

		def new
			@user_ingredients = current_user.user_ingredients.all
		end
	end
end