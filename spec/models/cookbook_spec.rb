require 'spec_helper'

describe Cookbook do 
	describe "assignment" do
		it { should allow_mass_assignment_of(:notes) }
		it { should allow_mass_assignment_of(:notes) }
	end

	describe "validations" do
		it { should validate_presence_of(:user_id)}
	end

	describe "associations" do
		it { should have_and_belong_to_many(:recipes) }
		it { should belong_to(:user) }
	end
end
