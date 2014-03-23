class RecipeIngredient < ActiveRecord::Base
	attr_accessible :quantity, :optional, :ingredient
	belongs_to :recipe
	belongs_to :ingredient
	attr_accessible :quantity, :optional
	accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
end
