require 'spec_helper'

describe Cookbook do 
	describe "assignment" do
		it { should allow_mass_assignment_of(:notes) }
		it { should allow_mass_assignment_of(:notes) }
	end

	describe "validations" do
		it { should validate_presence_of(:user_id)}
	end

	describe "associations" do
		it { should have_and_belong_to_many(:recipes) }
		it { should belong_to(:user) }
	end

	it "valid cookbook is valid" do
		create(:cookbook).should be_valid
	end

	describe "when created" do

		before(:all) do
			@cookbook = Cookbook.new(:user_id => 1)
		end

		it "should not have notes" do
			@cookbook.notes.should eq(nil)
		end

		it "should not have saved recipes" do
			@cookbook.saved_recipes.should eq(nil)
		end

		it "should be able to add recipes" do
			recipe = create(:recipe)
			expect{
				@cookbook.add_recipe(recipe.id)
				}.to change{@cookbook.recipes.count}.by(1)
		end

		it "should be able to remove recipes" do
			recipe = create(:recipe)
			expect{
				@cookbook.remove_recipe(recipe.id)
			}.to change{@cookbook.recipes.count}.by(1)
		end

		it "should be able to add notes to recipes" 
		# do
		# 				recipe = create(:recipe)
		# 	expect{
		# 		@cookbook.annotate(recipe.id)
		# 	}.to change{@cookbook.recipes.count}.by(1)
		# end

	end
end
