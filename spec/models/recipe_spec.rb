require 'spec_helper'

describe Recipe do

	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:instructions)}
	
	it "default recipe is valid" do
		create(:recipe).should be_valid
	end

	describe "assignment" do
		it {should allow_mass_assignment_of(:ingredients)}
		it {should allow_mass_assignment_of(:utensils)}
	end

	describe "associations" do
		it { should have_and_belong_to_many(:ingredients) }
		it { should have_and_belong_to_many(:utensils) }
		it { should have_and_belong_to_many(:cookbooks) }
		it { should have_many(:endorsements) }
		it { should belong_to(:user)}

	end

	describe "methods" do
		before(:all)  do
			@recipe = Recipe.new(
				:user_id => 1, 
				:dishname => "Pumpkin Pie",
				:instructions => "Do stuff"
				)
			e1 = Endorsement.new(:comments => "Nice recipe", :stars => 5, :recipe_id => 4, :user_id => 2)
			e2 = Endorsement.new(:comments => "Terrible recipe", :stars => 1, :recipe_id => 4, :user_id => 3)
			e3 = Endorsement.new(:comments => "Ok recipe", :stars => 3, :recipe_id => 4, :user_id => 4)
			@recipe.add_endorsement(e1)
			@recipe.add_endorsement(e2)
			@recipe.add_endorsement(e3)
		end

		it "should average endorsements" do
			expect(@recipe.calculate_rating).to eq(3.0)
		end

		it "should remember endorsements" do
			expect(@recipe.endorsements.count).to eq(3)
		end

		it "should print recipe" do
			expect(puts @recipe).to eq(0)
		end
	end

end