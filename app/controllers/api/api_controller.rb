module Api
	class ApiController < ApplicationController
		private
		def require_user
			if current_user.nil?
				redirect_to :root
			end
		end

		def require_admin
			redirect_to :root unless current_user.admin == true
		end
	end
end