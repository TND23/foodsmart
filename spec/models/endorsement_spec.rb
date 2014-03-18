require 'spec_helper'

describe Endorsement do
	
	describe "associations" do
		it { should belong_to(:recipe) }
		it { should belong_to(:user) }
	end

	it "should have a comment" do
		expect(build(:endorsement, :comments=> nil)).not_to be_valid
		expect(build(:endorsement, :comments=> "Anything else")).to be_valid
	end

	it "should have a rating in stars" do
		expect(build(:endorsement, :stars=> nil)).not_to be_valid
		expect(build(:endorsement, :stars=> 3)).to be_valid
	end

	it "the star rating should be between 0 and 5" do
		expect(build(:endorsement, :stars=> -1)).not_to be_valid
		expect(build(:endorsement, :stars=> 6)).not_to be_valid
	end

	context "::weigh_averages" do

		it "calculates averages" do
			arr = []
			e1 = Endorsement.new(:comments => "Nice recipe", :stars => 5, :recipe_id => 4, :user_id => 2)
			e2 = Endorsement.new(:comments => "Terrible recipe", :stars => 1, :recipe_id => 4, :user_id => 3)
			e3 = Endorsement.new(:comments => "Ok recipe", :stars => 3, :recipe_id => 4, :user_id => 4)
			arr << e1 << e2 << e3
			expect(Endorsement.weigh_averages(arr)).to eq(3.0)
		end

		it "returns 0 on nil" do
			arr = []
			expect(Endorsement.weigh_averages(arr)).to eq(0)
		end
	end

	it "correctly finds duplicates" do
		user = create(:user)
		e1 = Endorsement.new(:comments => "Nice recipe", :stars => 5, :recipe_id => 13, :user_id => 2)
		e2 = Endorsement.new(:comments => "Terrible recipe", :stars => 1, :recipe_id => 13, :user_id => 2)
		user.endorsements << e1 << e2
		recipe = create(:recipe, :rated => true, :id => 13)
		recipe.endorsements << e1 << e2
		expect(Endorsement.is_duplicate?(user, recipe)).to eq(true)
	end

end