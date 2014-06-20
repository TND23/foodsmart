class CookbookRecipe < ActiveRecord::Base
	attr_accessible :notes, :recipe_id
	belongs_to :cookbook
	belongs_to :recipe
	accepts_nested_attributes_for :cookbook, :recipe
	validates :cookbook_id, :presence => true
	validates :recipe_id, :presence => true 
end