json.array!(@recipes) do |recipe|
	json.partial!("api/recipes/recipe", :recipe => recipe)
end
json.recipes recipes.per_page