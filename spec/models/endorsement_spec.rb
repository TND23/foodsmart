require 'endorsement_spec'

describe Endorsement do
	
	describe "associations" do
		it { should belong_to(:recipe) }
		it { should belong_to(:user) }
	end

	it "should have a comment" do

	end

	it "should have a rating in stars" do

	end

	it "the star rating should be between 0 and 5" do

	end

	

end