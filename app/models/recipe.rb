class Recipe < ActiveRecord::Base
	attr_accessible :dishname, :description, :ingredients, :instructions, :recipe_ingredients, :recipe_ingredient_attributes, :utensils
	attr_accessor :cookbook_id

	validates :instructions, :presence => true
	validates :user_id, :presence => true
	validates :ingredients, :null => false
	belongs_to :user

	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients

	has_many :recipe_utensils
	has_many :utensils, :through => :recipe_utensils

	has_many :cookbook_recipes
	has_many :cookbooks, :through => :cookbook_recipes

	has_many :endorsements

	accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true

	def calculate_rating
		return 0 if self.endorsements.length == 0
		self.rating = Endorsement.weigh_averages(endorsements)
	end

	def self.filter_by_ingredients(*ingredients)
	end

	def self.search(search)
		if search && !search.empty?
			find(:all, :conditions => ['dishname LIKE ?', "#{search}"])
		else
			find(:all)
		end
	end

	def send_to_deleted_user
		
	end

	private
	def send_to_owners_cookbook
		self.cookbook_id = current_user.cookbook.id if current_user
	end
end