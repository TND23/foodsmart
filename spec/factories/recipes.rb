FactoryGirl.define do
	factory :recipe do |f|
		f.instructions "Stir it all around"
		f.dishname "The best soup"
		f.user_id 13
	end
end
