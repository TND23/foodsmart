require 'spec_helper'
describe User do
	it "valid user is considered be valid" do
		create(:user).should be_valid
	end

	it "cannot have an invalid username" do
		expect(build(:user, :username => "$%%")).not_to be_valid
	end

	it "admin works" do
      create(:admin).should be_valid
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

	it "has a password digest" do
		expect(build(:user).password_digest).not_to be_nil
	end

	describe "associations" do
		it { should have_one(:cookbook) }
		it { should have_many(:recipes) }
		it { should have_many(:endorsements) }
	end

	describe "attributes" do
		it "should recognize username" do
			user = create(:user, :username=> "Arby")
			user.username.should eq("Arby")
		end
	end
end
