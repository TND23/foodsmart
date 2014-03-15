require 'spec_helper'

describe Endorsement do
	
	describe "associations" do
		it { should belong_to(:recipe) }
		it { should belong_to(:user) }
	end

	it "should have a comment" do
		fail
	end

	it "should have a rating in stars" do
		fail
	end

	it "the star rating should be between 0 and 5" do
		fail
	end

	

end