require 'spec_helper'

describe "Recipe methods" do
	before(:all)  do
		@recipe = Recipe.create!(:user_id => 1, :dishname => "Pumpkin Pie",:instructions => "Do stuff")
		e2 = Endorsement.new(:comments => "Terrible recipe", :stars => 1, :recipe_id => 4, :user_id => 3)
		e3 = Endorsement.new(:comments => "Ok recipe", :stars => 3, :recipe_id => 4, :user_id => 4)
		@recipe.add_endorsement(e2)
		@recipe.add_endorsement(e3)
		puts @recipe
	end

	context "methods" do
		subject{@recipe}
		it "should average endorsements" do
			recipe = Recipe.new(:user_id => "1", :dishname => "Pumpkin Pie", :instructions => "Do stuff")
			recipe.save!
			expect(puts recipe).to eq(nil)
			
		end

		it "should remember endorsements" do
			expect(@recipe.endorsements.count).to eq(3)
		end

		it "should print recipe" do
			expect(puts @recipe).to eq(0)
		end
	end
	
end