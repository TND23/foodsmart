require 'spec_helper'

describe Utensil do
	
	describe "associations" do
		it { should have_and_belong_to_many(:recipes) }
	end

	describe "validations" do
		it { should validate_presence_of(:name)}
	end

end