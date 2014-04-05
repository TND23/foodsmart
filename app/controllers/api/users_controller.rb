module Api
	class UsersController < ApiController

		def new
			@user = User.new
		end

		def create
			#redirect to show on success
			@user = User.new(user_params)
  		if @user.save
  			login_user(@user)
  			redirect_to api_user_url(@user)
 			else
  			render :json => @user.errors.full_messages
  		end
		end

		def destroy
			@user = User.find_by_credentials(params[:user][:username], params[:user][:password])
			@user.destroy
			redirect_to root_url
		end

		def show

			@user = User.find(params[:id])
			#render :json => @user, :include => [:ingredients]
			if current_user.id == @user.id || current_user.admin
				render "api/users/show"
			else
				render :html => "NOJON"
			end
		end

		private

		def user_params
			params.require(:user).permit(:username, :password)
		end
	end
end