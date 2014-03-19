module Api

	class EndorsementsController < ApplicationController
		before_filter :require_user

		def create
			@endorsement = Endorsement.new(endorsement_params)
			if @endorsement.save
				render :json => "Success"
			else
				render :json => "failure"
			end
		end

		def show

		end

		def update
			
		end

		def destroy

		end

	end
end