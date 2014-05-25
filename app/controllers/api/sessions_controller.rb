module Api
	class SessionsController < ApplicationController

		before_filter :default_format_html

		def create
			user = User.find_by_credentials(params[:user][:username], params[:user][:password])
			if user.nil?
				flash[:error] = "Username or password"
				redirect_to :root
			else
				session[:session_token] = user.session_token
				id = current_user.id
				redirect_to root_url
			end
		end

		def destroy
			session[:session_token] = nil
			redirect_to :root
		end

		def new
			if current_user
				redirect_to root_url
			else
				render :new
			end
		end

		private

		def default_format_html
			request.format = "html"
		end
	end
end