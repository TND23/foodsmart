require 'spec_helper'

feature "basic user" do 
	it "can view recipe list" do
		visit(recipes_url) do
			expect(page).to have_content("All Submitted Recipes")
		end
	end

	it "can create a recipe" do
		visit(new_recipe_url) do
			expect(page).to have_content("Ingredients:")
			expect(page).to have_content("Utensils:")
			expect(page).to have_content("Instructions:")
		end
	end

	it "can delete account" do

	end

	it "can search for recipes" do

	end

	it "can create recipes" do

	end

	it "can endorse recipes" do

	end

	it "can add ingredients to stock" do

	end

	it "can add recipes to cookbook" do

	end

	it "can add notes to recipes in cookbook" do

	end

	feature "cannot create an invalid recipe" do
		before(:each) do
			visit(new_recipe_url)
		end

		it "must have ingredients" do
			fill_in 'utensils', :with => 'spoon, fork'
			fill_in 'instructions', :with => 'use a spoon and fork'
			click_on('Submit')
			expect(page).to have_content('Please include ingredients.')
		end
	end
end