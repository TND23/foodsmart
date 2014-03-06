class Cookbook < ActiveRecord::Base
	attr_accessible :notes
	attr_reader :recipes
	
	has_and_belongs_to_many :recipes
	belongs_to :user
	validates :user_id, :presence => true

	def set_user(user)

	end
	
	def maintain
		#if a user deletes self, their referenced recipes are not deleted
	end	
	
end
