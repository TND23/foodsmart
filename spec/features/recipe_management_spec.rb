require 'spec_helper'

feature "basic user" do
	context "not recipe owner" do
		it "can not give permission"
		it "can not edit a recipe"
	end

	context "recipe owner" do
		it "can not give permission"
		it "can edit a recipe"
	end

	#scenario "" do
	# visit (url)
	# fill_in, click_button etc
end