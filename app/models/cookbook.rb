class Cookbook < ActiveRecord::Base
	attr_accessible :notes, :user_id
	has_many :cookbook_recipes
	has_many :recipes, :through => :cookbook_recipes
	belongs_to :user
	validates :user_id, :presence => true

	def self.maintain 
		# called on destroy
		# if a user deletes self, their referenced recipes
		# are sent to a global cookbook
		# this way, other users who have favorited their recipes will not lose data
	end

	def find_referenced

	end

	def send_referenced

	end
	
end
