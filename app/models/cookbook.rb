class Cookbook < ActiveRecord::Base
	has_and_belongs_to_many :recipes
	belongs_to :user

	attr_reader :recipes
	
end
