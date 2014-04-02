class Ingredient < ActiveRecord::Base
	attr_accessible :name, :description
	validates :description, :presence => true
	has_many :recipe_ingredients
	has_many :recipes, :through => :recipe_ingredients
	has_many :user_ingredients
	has_many :users, :through => :user_ingredients
end
