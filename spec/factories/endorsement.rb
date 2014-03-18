FactoryGirl.define do 
	factory :endorsement do |f|
		f.stars rand(5)
		f.recipe_id (1..10).to_a.sample
		f.user_id (11..20).to_a.sample

	end

end