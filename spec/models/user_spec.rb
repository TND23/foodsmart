require 'spec_helper'

	describe User do
		it "valid user is considered be valid" do
				FactoryGirl.create(:user).should be_valid
		end

		it "cannot have invalid username" do
				expect(FactoryGirl.build(:user, :username => "$%%")).not_to be_valid
		end

		it "must have long enough password" do
				expect(FactoryGirl.build(:user, :password => "123")).not_to be_valid
		end
		
end
