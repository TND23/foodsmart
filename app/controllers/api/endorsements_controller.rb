module Api
	class EndorsementsController < ApiController
		before_filter :require_user

		def create
			@endorsement = Endorsement.new(endorsement_params)
			@endorsement.user_id = current_user.id
			recipe = Recipe.find(params[:recipe_id])
			@endorsement.recipe_id = recipe.id
			duplication = Endorsement.is_duplicate?(current_user, recipe)
			if !duplication
				if @endorsement.save
					render :json => @endorsement
				else
					render :json => @endorsement.errors
				end
			else
				render :json => "No sneaking about"
			end
		end

		def index
			@recipe = Recipe.find(params[:recipe_id])
			@endorsements = Endorsement.where(:recipe_id => @recipe.id)
			render "api/endorsements/index"
		end

		def show
			@endorsement = Endorsement.find(params[:id])
		end

		# TODO
		def update
		end

		def destroy
		end

		private
		def endorsement_params
			params.require(:endorsement).permit(:comments, :stars, :recipe_id)
		end
	end
end