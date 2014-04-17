class UserIngredient < ActiveRecord::Base
	belongs_to :user
	belongs_to :ingredient
	attr_accessible :name, :quantity, :units

	#this should be the same as a recipeIngredient in terms of structure.
end