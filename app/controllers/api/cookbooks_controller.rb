module Api
	class CookBooksController < ApplicationController
		def new
			@cookbook = Cookbook.new
		end

		def create
			cookbook = Cookbook.new(params[:user_id])
			cookbook.save
		end
	end
end