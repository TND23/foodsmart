module ApplicationHelper
	
	def is_a_mac?
		(request.env["HTTP_USER_AGENT"] =~ /Windows/) ? true: false
	end

	def put_request_env
		request.env["HTTP_USER_AGENT"]
	end

end
