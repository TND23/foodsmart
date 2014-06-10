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

	private
	def send_to_deleted_user		
	end

	def send_to_owners_cookbook
		self.cookbook_id = current_user.cookbook.id if current_user
	end
end