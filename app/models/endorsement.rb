class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe
	attr_accessible :comments, :stars, :recipe_id
	attr_reader :user_id
	validates :stars, :presence => true
	validates :stars, inclusion: {in: (0..5)}
	validates :comments, :presence => true

	def rating=(val)
		val.to_s.to_f
		val
	end

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
			return true if endorsement[:user_id] === user.id
		end
		false
	end
	
end