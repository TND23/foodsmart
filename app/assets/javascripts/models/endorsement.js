App.Models.Endorsement = Backbone.Model.extend({

	initialize: function(options){
		this.set("user_id", App.current_user.id);
		this.set("recipe_id", options.recipe_id);
	},

	url: function(){
		return "api/recipes/" + this.get("recipe_id") + "/endorsements"
	}  
});