class UsersController < ApplicationController
	
	before_filter :require_current_user!, :only => [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
    	if @user.save
    		render :json => @user
   		else
    		render :json => @user.errors.full_messages
    	end
	end

	def destroy
		
	end

	def show
		
	end
	
end