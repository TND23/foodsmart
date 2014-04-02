class UserIngredient < ActiveRecord::Base
	belongs_to :user
	belongs_to :ingredient
	attr_accessible :name, :quantity, :units
end