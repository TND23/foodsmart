module Api
	class UserIngredientsController < ApiController
		before_filter :require_user

		def index
			@user_ingredients = current_user.user_ingredients.all	
		end

		def create
			@user_ingredient = UserIngredient.new(user_ingredient_params)
			@user_ingredient.user_id = current_user.id
			if @user_ingredient.save
				render :json => @user_ingredient
			else
				render :json => { :errors => @user_ingredient.errors.full_messages }
			end
		end

		def destroy
			@user_ingredient = UserIngredient.where(:user_id => current_user.id, :name => params[:name])
		end

		def new
			@user_ingredients = current_user.user_ingredients.all
		end

		private
		def user_ingredient_params
			params.require(:user_ingredient).permit(:name, :quantity, :units)
		end

	end
end