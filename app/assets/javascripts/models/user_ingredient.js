App.Models.UserIngredient = Backbone.Model.extend({


	initialize: function(options){

	},

	urlRoot: function(){
		return "/api/users/" + Api.current_user + "/user_ingredients" 
	}  
	
});