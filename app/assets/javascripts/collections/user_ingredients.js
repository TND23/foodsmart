App.Collections.UserIngredients = Backbone.Collection.extend({
	model: App.Models.UserIngredient,

	initialize: function(options){
		this.userIngredient = options.userIngredient;
	},

	url: function(){
		return "api/users/" + App.current_user.id  + "/user_ingredients"; 
	}

});