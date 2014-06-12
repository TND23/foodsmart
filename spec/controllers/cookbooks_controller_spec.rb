require 'spec_helper'

describe Api::CookbooksController do 


	describe "#show" do
		cookbook = Cookbook.create
		get :show
	end

	describe "edit" do
		#for adding notes

	end

	describe "update" do
		#for adding notes

	end
	
end