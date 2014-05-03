# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :user, aliases: [:author, :commenter] do 
  	username Faker::Name.first_name
  	password "123456"
  end

  factory :invalid_user, :parent => :user do 
  	username nil
  	password "dontwork"
  	admin false
  end

  factory :admin, :class => User do
  	username "admin"
  	password "123456"
  	admin true
  end

  factory :peasant, :class => User do
  	username "peasant"
  	password "123456"
  	admin false
  end

end
