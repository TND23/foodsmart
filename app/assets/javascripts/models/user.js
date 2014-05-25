App.Models.User = Backbone.Model.extend({

	initialize: function(options){
		
		this.id = options.id;
		this.cookbook_id = options.cookbook_id;
		if (this.isValid()){
			this.cookbook = new App.Models.Cookbook([], {user: this, id: this.cookbook_id});
			this.user_ingredients = new App.Collections.UserIngredients([], {user: this});
			this.user_ingredients.fetch();
		}
	},

	url: function(){
		return "api/users/" + this.id;
	} 
});