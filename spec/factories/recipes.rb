FactoryGirl.define do
	factory :recipe do |f|
		f.instructions "Stir it all around"
		f.author_name "bob"
		f.user_id 13
		f.cookbook_id 1
	end
end
