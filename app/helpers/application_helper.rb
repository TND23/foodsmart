module ApplicationHelper
	
	def is_a_windows?
		(request.env["HTTP_USER_AGENT"] =~ /Windows/) ? true: false
	end

	def put_request_env
		request.env["HTTP_USER_AGENT"]
	end

	def mobile_device?
		(request.user_agent =~ /Mobile|Android/) ? true : false
	end

	def put_agent
		request.user_agent
	end

end
