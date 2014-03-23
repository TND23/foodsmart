# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient, :class => 'RecipeIngredient' do |f|
  	f.quantity = 3.0
  	f.units = "pounds"
  end
end
