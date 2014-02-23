class UsersController < ApplicationController
	
	before_filter :require_current_user!, :only => [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			self.user = current_user
			redirect_to user_url(@user)
		end
	end

	def destroy
		
	end

	def show
		
	end
	
end