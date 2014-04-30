module Api
	class CookbooksController < ApiController
		before_filter :require_user

		def new
			@cookbook = Cookbook.new
		end

		def show
			@cookbook = current_user.cookbook
			@recipes = @cookbook.saved_recipes
			render "api/cookbooks/show"
		end

		def index
			@cookbooks = Cookbook.all
		end
	end
end