App.Models.Endorsement = Backbone.Model.extend({

	initialize: function(options){
		this.set("user_id", options.user_id);
		this.set("recipe_id", options.recipe_id);
	},

	url: function(){
		return "api/recipes/" + this.get("recipe_id") + "/endorsements"
	}  
});