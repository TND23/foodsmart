class Recipe < ActiveRecord::Base

	attr_accessible :ingredients, :utensils
	attr_reader :cookbooks

	validates :instructions, :presence => true
	validates :author_name, :presence => true
	belongs_to :user
	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :utensils
	has_and_belongs_to_many :cookbooks
	has_many :endorsements

	def ingredients
		
	end

	def self.filter_by_ingredients

	end

	def has_ingredient?(ingredient)

	end

	def has_endorsements?

	end

	def send_to_deleted_user
		#if user deletes self, the recipe is sent to "deleted_user"
	end

	

	# helper with find_by_ingredients

	


end