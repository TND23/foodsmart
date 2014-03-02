# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
  	f.username "bob"
  	f.password "123456"
  	f.session_token "anunlikelysessiontoken"
  end
end
