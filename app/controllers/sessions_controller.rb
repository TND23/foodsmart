class SessionsController < ApplicationController
	

	def create
		# if User.find_by_credentials(params[:user][:user_name]).nil?
		# 	flash[:errors] = "Incorrect Username"
		# 	render :new
		# 	return
		user = User.find_by_credentials(params[:user][:user_name], params[:user][:password]).nil?
		if user.nil?
			flash[:errors] = "Incorrect Password"
			render :new
			return
		else
			login_user(user)
			redirect_to api_user_url
		end
	end
			


	def destroy
		session[:session_token] = nil
		render :new
	end

	def new
	
	end

end