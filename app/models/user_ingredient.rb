class UserIngredient < ActiveRecord::Base
	belongs_to :user
	belongs_to :ingredient
	attr_accessible :quantity, :units
end