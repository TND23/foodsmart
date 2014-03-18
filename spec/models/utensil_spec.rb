require 'spec_helper'

describe Utensil do
	
	describe "associations" do
		it { should have_and_belong_to_many(:recipes) }
	end

	describe "attributes" do
		it "should have a name" do
			expect(create(:utensil, :name => nil)).to_not be_valid
		end
	end
end