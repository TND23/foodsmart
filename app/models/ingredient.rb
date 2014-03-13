class Ingredient < ActiveRecord::Base
	attr_accessible :name, :description
	has_and_belongs_to_many :recipes



	#look into naming for html forms and input
end
