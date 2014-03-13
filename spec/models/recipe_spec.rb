require 'spec_helper'

describe Recipe do
	it "default recipe is valid" do
		create(:recipe).should be_valid
	end

	it "recipe must have an author" do
		expect(build(:recipe, :author_name => nil)).not_to be_valid
	end

	it "recipe must have instructions" do
		expect(build(:recipe, :instructions => nil)).not_to be_valid
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