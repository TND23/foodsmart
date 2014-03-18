module Api
	class SessionsController < ApplicationController

		def create
			@user = User.find_by_credentials(params[:user][:username], params[:user][:password])
			if @user.nil?
				redirect_to :root
			else
				session[:session_token] = @user.session_token
				redirect_to api_user_url(@user)
			end
		end

		def destroy
			@user.reset_session_token
			session[:session_token] = @user.session_token
			@user.session_token = nil
		end

		def new

		end
	end
end