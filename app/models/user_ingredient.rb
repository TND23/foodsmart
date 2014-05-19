class UserIngredient < ActiveRecord::Base
	attr_accessible :name, :quantity, :units
	
	belongs_to :user
	belongs_to :ingredient
	before_validation :set_ingredient_id
	private

	def	set_ingredient_id
		name = self["name"]
		@ingredient = Ingredient.find_by_name(name)
		@ingredient ? self["ingredient_id"] = @ingredient.id :	self["ingredient_id"] = 0
	end
end