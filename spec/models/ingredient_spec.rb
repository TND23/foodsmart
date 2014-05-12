require 'spec_helper'

describe Ingredient do 

	it { should validate_presence_of(:description) }

	it { should have_many(:recipes) }

	it {should allow_mass_assignment_of(:name) }

	it {should allow_mass_assignment_of(:description) }

	context "user is admin" do
	#it('should be destructible only by administrators and creator', function(){
		#shouldn't this be in the ruby specs?
	#});
	end
	
	context "user is not admin" do
	# it('should be creatable by anyone', function(){
	# // shouldn't this be in the ruby specs?		
	# });
	end
end