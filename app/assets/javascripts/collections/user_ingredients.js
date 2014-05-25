App.Collections.UserIngredients = Backbone.Collection.extend({
	model: App.Models.UserIngredient,

	initialize: function(models, options){
		this.user_id = options.user.id;
	},

	url: function(){
		return "api/users/" + this.user_id  + "/user_ingredients"; 
	},

	addIngredient: function(name){
		
	},

});