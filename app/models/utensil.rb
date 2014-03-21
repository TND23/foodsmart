class Utensil < ActiveRecord::Base
	has_many :recipe_utensils
	has_many :recipes, :through => :recipe_utensils
	validates :name, :presence => true
end