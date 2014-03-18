# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:author, :commenter] do |f|
  	f.username "bob"
  	f.password "123456"
  	f.session_token "anunlikelysessiontoken"
  	f.cookbook_id 1
  end

end
