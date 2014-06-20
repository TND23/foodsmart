App.Collections.Endorsements = Backbone.PageableCollection.extend({

	model: App.Models.Endorsement,
	
	url: function(){
		return "api/recipes/" + this.recipe_id + "/endorsements"
	},

	initialize: function(models, options){
		this.recipe_id = options.recipe.id;
	},

});