module Api
	class CookBooksController < ApplicationController
		def new
			@cookbook = Cookbook.new
		end

		def create
			@user = User.find(params[:user_id])
			@cookbook = Cookbook.new(params[:cookbook])
			@cookbook.user_id = @user.id
			@cookbook.save
		end
	end
end