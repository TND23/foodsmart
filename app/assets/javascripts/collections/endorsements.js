App.Collections.Endorsements = Backbone.Collection.extend({

	model: App.Models.Endorsemet,
	
	url: function(recipe_id){
		return "api/recipes/" + this.recipe.get("id") + "/endorsements"
	},

	initialize: function(models, options){
		this.attributes.recipe_id = options.recipe.get("id");
	}
});