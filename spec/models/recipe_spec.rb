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
		it { should have_many(:ingredients) }
		it { should have_many(:utensils) }
		it { should have_many(:cookbooks) }
		it { should have_many(:endorsements) }
		it { should belong_to(:user)}
	end

	context "when recipe is invalid" do

	end

	context "when recipe is valid and has endorsements" do
		it "should average endorsements correctly" do
			recipe = Recipe.new(
				:user_id => 1, 
				:dishname => "Pumpkin Pie",
				:instructions => "Do stuff"
				)
			e1 = Endorsement.new(:comments => "Nice recipe", :stars => 5, :recipe_id => 4, :user_id => 2)
			e2 = Endorsement.new(:comments => "Terrible recipe", :stars => 1, :recipe_id => 4, :user_id => 3)
			e3 = Endorsement.new(:comments => "Ok recipe", :stars => 3, :recipe_id => 4, :user_id => 4)
			recipe.add_endorsement(e1)
			recipe.add_endorsement(e2)
			recipe.add_endorsement(e3)
			expect(recipe.calculate_rating).to eq(3.0)
		end
	end

	context "when recipe is valid and has no endorsements" do
			let(:recipe_two) do
				stub_model Recipe, :id => 42, :instructions => "Lorem lorem ipsum etc.",
			 	:user_id => 10, :dishname => "Computer on chips", :instructions => "Get a tandy & place in oven",
			 	:description => "Not very edible", :user_id => 2
			end
		it "should return null when calculating rating" do
			expect(recipe_two.endorsements.length).to eq(0)
		end
		it "should return null when calculating rating" do
			expect(recipe_two.calculate_rating).to eq(0)
		end
	end

end