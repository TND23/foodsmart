class Recipe < ActiveRecord::Base

	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :utensils
	has_and_belongs_to_many :cookbooks
	has_many :endorsements


	def self.has_ingredient?(ingredient)

	end

	def self.has_endorsements?

	end

	


end