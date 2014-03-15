class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe

	def self.prevent_duplicates(user, recipe)

	end
	
	def self.filter_by_rating(stars)

	end

	def modify_text

	end

	def modify_stars

	end
end