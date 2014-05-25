class UserIngredient < ActiveRecord::Base
	attr_accessible :name, :quantity, :units
	
	belongs_to :user
	belongs_to :ingredient
	before_validation :set_attrs
	private

	def set_attrs
		name = self["name"]
		@ingredient = Ingredient.find_by_name(name)
		if @ingredient 
			self["ingredient_id"] = @ingredient.id
		else
			self["ingredient_id"] = 0
		end
	end
end