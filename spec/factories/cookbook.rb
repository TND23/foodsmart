FactoryGirl.define do
	factory :cookbook do |f|
		f.user_id 1
		f.saved_recipes ""
		f.notes ""
	end	
end