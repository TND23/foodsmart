App.Collections.Endorsements = Backbone.Collection.extend({

	model: App.Models.Endorsement,
	
	url: function(recipe){
		return "api/recipes/" + this.get("recipe_id") + "/endorsements"
	},

	initialize: function(options){
		this.set("recipe_id", options.recipe_id);
	}
});