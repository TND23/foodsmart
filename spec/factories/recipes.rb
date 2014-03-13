FactoryGirl.define do
	factory :recipe do |f|
		f.instructions "Stir it all around"
		f.author_name "bob"
		f.ingredients "Carrots, Tomatoes, Onions"
		f.user_id 13
	end
end
