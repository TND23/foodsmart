# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username "bob"
  	password "123456"
  	session_token "anunlikelysessiontoken"
  end
end
