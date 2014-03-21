class RecipeUtensil < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :utensil
	
end
