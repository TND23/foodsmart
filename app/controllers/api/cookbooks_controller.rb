module Api

	class CookBooksController < ApiController

		before_filter :require_user

		def new
			@cookbook = Cookbook.new
		end

		def create
			cookbook = Cookbook.new(params[:user_id])
			cookbook.save
		end

		def index

		end
	end
end