class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe


	def self.weigh_averages(*endorsements)
		arr = []
		endorsements.each do |endorsement|
			arr << endorsement.stars.to_f
		end
		average_sum = arr.inject(:+) / arr.length
		average_sum

	def self.prevent_duplicates(user, recipe)

	end
	
end