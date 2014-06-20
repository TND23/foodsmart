class Endorsement < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe
	attr_accessible :comments, :stars
	validates :stars, :presence => true
	validates :stars, inclusion: {in: (0..5)}
	validates :comments, :presence => true

	def self.is_duplicate?(user, recipe)
		return false if !recipe.rated
		recipe.endorsements.each do |endorsement|
			next if !endorsement.is_a?(Endorsement)
			return true if endorsement[:user_id] === user.id
		end
		false
	end
	
end