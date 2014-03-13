module Api
	class ApiController < ApplicationController
		before_filter :require_user

		private
		
		def require_user
			#TODO
		end



	end
end