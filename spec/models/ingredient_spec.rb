require 'spec_helper'

describe Ingredient do 

	it "Should have a description" do
		expect(build(:ingredient, :description => null)).not_to be_valid
	end


end