App.Collections.Endorsements = Backbone.PageableCollection.extend({

	model: App.Models.Endorsement,
	
	url: function(recipe){
		return "api/recipes/" + this.recipe_id + "/endorsements"
	},

	initialize: function(options){
		this.recipe_id = options.recipe.id;
	},

});