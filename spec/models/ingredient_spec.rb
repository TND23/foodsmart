require 'spec_helper'

describe Ingredient do 

	it "Should have a description" do
		expect(build(:ingredient, :description => null)).not_to be_valid
	end

	it { should have_and_belong_to_many(:recipes)}

	it {should allow_mass_assignment_of(:name)}

	it {should allow_mass_assignment_of(:description)}

end