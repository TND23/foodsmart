require 'spec_helper'

describe RecipeIngredient do
	describe "It has associations" do
		it { should belong_to(:recipe) }
		it { should belong_to(:ingredient) }
	end
	
	describe "It has a quantity" do
		# expect(:recipe.attributes).to include("quantity")

	end

end