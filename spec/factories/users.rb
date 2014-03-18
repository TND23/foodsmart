# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :user, aliases: [:author, :commenter] do 
  	username Faker::Name.first_name
  	password "123456"
  end

end
