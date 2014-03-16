class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe


	def self.weigh_averages(*endorsements)
		arr = []
		endorsements.each{ |endorsement| arr << endorsement.stars.to_f }
		average_sum = arr.inject(:+) / arr.length
		average_sum
	end

	def self.prevent_duplicates(user, recipe)

	end
	
end