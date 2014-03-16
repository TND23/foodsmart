class Recipe < ActiveRecord::Base

	attr_accessible :ingredients, :utensils
	attr_reader :cookbooks
	validates :instructions, :presence => true
	validates :user_id, :presence => true
	validates :ingredients, :null => false
	belongs_to :user
	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :utensils
	has_and_belongs_to_many :cookbooks #in case of collaborative recipe
	has_many :endorsements

	def calculate_rating
		endorsements = self.endorsements
		return "No data" if endorsements.nil?
		self.average_rating = Endorsement.weigh_averages(endorsements)
	end

	def add_ingredients(ingredients)

	end

	def remove_ingredients(ingredients)
	
	end

	def self.filter_by_ingredients

	end

	def has_ingredient?(ingredient)

	end

	def send_to_deleted_user
		#if user deletes self, the recipe is sent to "deleted_user"
	end

	def author

	end

	def endorsements

	end

end