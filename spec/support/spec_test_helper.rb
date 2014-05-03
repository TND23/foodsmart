module SpecTestHelper

	def login(user)
		#this will be a relation
		user = User.where(:username => user.to_s).first if user.is_a?(Symbol)
		session[:session_token] = user.session_token
	end

	def current_user
		return nil unless session[:session_token]
		@current_user ||= User.find_by_session_token(session[:session_token])
	end
	
end