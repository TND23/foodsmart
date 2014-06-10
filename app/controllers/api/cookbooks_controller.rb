module Api
	class CookbooksController < ApiController
		before_filter :require_user
		before_filter :default_format_html, :only => :show

		def new
			@cookbook = Cookbook.new
		end

		def show
			@cookbook = current_user.cookbook
			@cookbook_recipes = @cookbook.cookbook_recipes
			render :show, :layout => false
		end

		def index
			@cookbooks = Cookbook.all
		end

		private

		def default_format_html
			request.format = "html"
		end
	end
end