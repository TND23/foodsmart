module Api

	class EndorsementsController < ApiController
		before_filter :require_user

		def create
			@endorsement = Endorsement.new(endorsement_params)
			#@endorsement.stars = params[:endorsement][:stars].to_f
			@endorsement.user_id = current_user.id
			recipe = Recipe.find(params[:recipe_id]) 
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

		def show
		end

		def update
		end

		def destroy
		end

		private
		def endorsement_params
			params.require(:endorsement).permit(:comments, :rating, :recipe_id)
		end
	end
	
end