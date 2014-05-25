module Api
	class UsersController < ApiController
		
		def index
			@users = User.all
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
  		if @user.save
  			create_related_cookbook(@user.id)
  			login_user(@user)
  			redirect_to ""
 			else
 				flash[:error] = "That username may have already been taken."
 				redirect_to ""
  		end
		end

		def destroy
			@user = User.find_by_credentials(params[:user][:username], params[:user][:password])
			@user.destroy
			redirect_to root_url
		end

		def show
			@user = User.find(params[:id])
			if current_user.id == @user.id || current_user.admin
				render "api/users/show"
			else
				render :json => "NO JOY"
			end
			
		end

		private
		def user_params
			params.require(:user).permit(:username, :password)
		end

		def create_related_cookbook(id)
				@cookbook = Cookbook.new({:user_id => id})
  			@cookbook.user = @user
  			@cookbook.save!
		end
	end
end