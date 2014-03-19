module Api
	class SessionsController < ApplicationController

		def create
			user = User.find_by_credentials(params[:user][:username], params[:user][:password])
			if user.nil?
				redirect_to :root
			else
				session[:session_token] = user.session_token
				id = current_user.id
				cookbook_id = current_user.cookbook.id
				redirect_to api_user_cookbook_url(id, cookbook_id)
			end
		end

		def destroy
			session[:session_token] = nil
			#current_user.reset_session_token  why doesn't this work?

			redirect_to :root
		end

		def new

		end
	end
end