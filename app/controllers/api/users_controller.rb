module Api
	class UsersController < ApiController

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
    		if @user.save
    			login_user(@user)
    			redirect_to api_user_url(@user)
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