module Api
	class CookBooksController < ApiController
		def new
			@cookbook = Cookbook.new
		end

		def create
			cookbook = Cookbook.new(params[:user_id])
			cookbook.save
		end
	end
end