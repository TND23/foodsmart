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
end