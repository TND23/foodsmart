class RecipeIngredient < ActiveRecord::Base
	attr_accessible :quantity, :optional, :ingredient, :units
	belongs_to :recipe
	belongs_to :ingredient
	accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
end