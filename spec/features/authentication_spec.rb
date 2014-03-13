require 'spec_helper'

feature "sign up process" do
	it "has a user page" do 
		visit new_user_url
		expect(page).to have_content("Register")
	end

	it "redirects to the tutorial page" do
		expect(page).to have_content("Tour")
	end

	feature "sign up validations" do
		before(:each) do
			fill_in 'username', :with => "Jose"
			fill_in 'password', :with => "123456"
			#fill_in 'password_conf', :with => "123456"
			click_on "Join"
		end

	end
end