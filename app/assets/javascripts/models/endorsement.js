App.Models.Endorsement = Backbone.Model.extend({


	initialize: function(models, options){
		this.recipe_id = options.recipe_id;
	},

	urlRoot: function(){
		return "/api/recipes/" + this.recipe_id + "/endorsements"
	},

	checkDuplication: function(){
		
	},
});