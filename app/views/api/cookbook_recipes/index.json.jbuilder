json.array!(@cookbook_recipes) do |cookbook_recipe|
	json.partial!("api/cookbook_recipes/cookbook_recipe", :cookbook_recipe => cookbook_recipe)
end