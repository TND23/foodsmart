module Api
	class UsersController < ApiController
		
		before_filter :require_current_user!, :only => [:show]

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
	    	if @user.save
	    		cookbook = CookBook.new()
	    		@user.cookbook_id = cookbook_id
	    		render :json => @user
	   		else
	    		render :json => @user.errors.full_messages
	    	end
		end

		def destroy
			
		end

		def show
			
		end

		private

		def user_params
			params.require(:user).permit(:username, :password)
		end
		
	end
end