require 'spec_helper'
# adding FactoryGirl::Syntax::Methods is nice
describe User do
	it "valid user is considered be valid" do
		create(:user).should be_valid
	end

	it "cannot have invalid username" do
		expect(build(:user, :username => "$%%")).not_to be_valid
	end

	it "cannot have a sneaky username" do
		expect(build(:user, :username => "<script>")).not_to be_valid
	end

	it "cannot have too long a username" do
		expect(build(:user, :username => "abcdefghijklmnopqrstuvwxyz")).not_to be_valid
	end

	it "must have long enough password" do
		expect(build(:user, :password => "123")).not_to be_valid
	end

	it "has a cookbook upon creation" do

	end
		
end
