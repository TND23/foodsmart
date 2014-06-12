App.Models.User = Backbone.Model.extend({

	initialize: function(options){
		var that = this;
		//var cookbook_id = options.cookbook_id
		this.user_ingredients = new App.Collections.UserIngredients([], {user: this});
		this.user_ingredients.fetch();		
		//this.cookbook = new App.Models.Cookbook([], {user: this, cookbook_id: cookbook_id});

	},

	urlRoot: function(){
		return "api/users/";
	} 
});