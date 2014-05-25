App.Collections.RecipeIngredients = Backbone.Model.extend({
	model: App.Models.Recipe,
	initialize: function(options, models){

	},

	url: function(recipe){
		"api/recipes/"	+ recipe.get("id") + "/recipe_ingredients"
	}
});