class RecipeIngredient < ActiveRecord::Base
	attr_accessible :quantity, :optional, :ingredient, :units, :name
	attr_reader :name
	belongs_to :recipe
	belongs_to :ingredient
	accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
	before_validation :set_ingredient_id
	
	private

	def	set_ingredient_id
		name = self["name"]
		@ingredient = Ingredient.find_by_name(name)
		@ingredient ? self["ingredient_id"] = @ingredient.id :	self["ingredient_id"] = 0
	end
end