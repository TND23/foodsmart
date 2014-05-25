class RecipeIngredient < ActiveRecord::Base
	attr_accessible :quantity, :optional, :units, :name
#	attr_reader :name
	belongs_to :recipe
	belongs_to :ingredient
	accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
	before_validation :set_attrs
	
	private

	def set_attrs
		name = self["name"]
		@ingredient = Ingredient.find_by_name(name)
		if @ingredient 
			self["ingredient_id"] = @ingredient.id
			self["description"] = @ingredient.description
		else
			self["ingredient_id"] = 0
		end
	end
end