module Api
	class ApiController < ApplicationController
		before_filter :require_user
		def require_user
			#TODO
		end
	end
end