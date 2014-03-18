require 'faker'

FactoryGirl.define do 
	factory :endorsement do |f|
		f.stars [0,1,2,3,4,5].sample
		f.recipe_id (1..10).to_a.sample
		f.user_id (11..20).to_a.sample
		f.comments Faker::Lorem.sentence

	end

end