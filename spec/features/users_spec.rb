require 'spec_helper'

feature "basic user" do 
	it "can view own recipe list" do
		visit(recipes_url) do
			expect(page).to have_content("All Submitted Recipes")
		end
	end

	it "can visit the recipe construction page" do
		visit(new_recipe_url) do
			expect(page).to have_content("Ingredients:")
			expect(page).to have_content("Utensils:")
			expect(page).to have_content("Instructions:")
		end
	end

	it "can delete account" do
		@user = create(:user)
		@user.destroy
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

	feature "user without permission" do
		context "without permission" do
			it "can not give permission" do
				fail
			end

			it "can not edit a recipe" do
				fail
			end
		end
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
