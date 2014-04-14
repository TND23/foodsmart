App.Models.Endorsement = Backbone.Model.extend({

	urlRoot: function(models, options){
		return "/api/recipe" + options.recipe_id + "/endorsements"
	},

	checkDuplication: function(){
		
	},

	weighAverages: function(){
		
	},
});