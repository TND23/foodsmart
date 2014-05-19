class StaticPagesController < ApplicationController
	def root
		if !current_user
			redirect_to new_api_session_url
		else
			render :root
		end
	end
end