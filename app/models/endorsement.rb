class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe
	attr_accessible :comments, :stars, :user_id
	attr_accessor :comments, :stars
	validates :stars, inclusion: {in: (0..5), message: "Rating failed a lot"}


	def self.weigh_averages(endorsements)
		return 0 if ( endorsements.nil? || endorsements.empty? )
		arr = []
		endorsements.each { |endorsement| arr << endorsement.stars.to_f }
		average_sum = arr.inject(:+) / arr.length
		average_sum
	end

	def self.is_duplicate?(user, recipe)
		return false if !recipe.rated
		recipe.endorsements.each do |endorsement|
			next if !endorsement.is_a?(Endorsement)
			return true if endorsement[:user_id] === user_id
		end
		false
	end



end