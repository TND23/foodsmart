require 'spec_helper'

describe User do
	describe User do
		it "cannot have invalid username" do
			FactoryGirl.create(:user).should_be_valid
		end
	end
end
