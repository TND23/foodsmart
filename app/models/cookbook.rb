class Cookbook < ActiveRecord::Base
	attr_accessible :notes
	attr_reader :recipes, :user_id
	
	has_and_belongs_to_many :recipes
	belongs_to :user

	def initialize(user_id)
		@user_id = user.id
	end

	def set_user(user)

	end
	
	def maintain
		#if a user deletes self, their referenced recipes are not deleted
	end	
	
end
