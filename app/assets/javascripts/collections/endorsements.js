App.Collections.Endorsements = Backbone.Collection.extend({

	model: App.Models.Ingredient,
	
	url: function(recipe_id){
		return "api/recipes/" + this.recipe.get("id") + "/endorsements"
	},

	initialize: function(models, options){
		this.recipe = options.recipe;
	}
});