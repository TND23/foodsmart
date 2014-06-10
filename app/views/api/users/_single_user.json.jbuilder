json.(@user, :id, :username, :admin, :user_ingredients)	

json.cookbook do 
	json.id cookbook.id
	json.user_id cookbook.user_id
	json.saved_recipes cookbook.saved_recipes
	json.notes cookbook.notes
	json.cookbook_recipes cookbook_recipes
end