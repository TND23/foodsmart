module Api
	class UserIngredientsController < ApiController
		before_filter :require_user

		def index
			@user_ingredients = current_user.user_ingredients.all
			render :json => @user_ingredients
		end

		def create
			@user_ingredient = UserIngredient.new(params[:user_ingredient])
			ingredient = Ingredient.find_by_name(@user_ingredient.name)
			if ingredient != nil && @user_ingredient.quantity != nil && @user_ingredient.units != nil
				@user_ingredient.ingredient_id = ingredient.id
				@user_ingredient.user_id = current_user.id
				@user_ingredient.save
			elsif ingredient == nil
				@user_ingredient.errors = "You can't have a blank name"
				render :json => {:errors => @user_ingredient.errors.full_messages }
			else
				render :json => {:errors => @user_ingredient.errors.full_messages }
			end
		end

		def destroy

		end
	end
end