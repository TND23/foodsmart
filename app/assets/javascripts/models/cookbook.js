App.Models.Cookbook = Backbone.Model.extend({

	initialize: function(models, options){
		this.user_id = options.user.id;
		// set cookbookrecipes after cookbook has an ID
		this.cookbook_recipes = new App.Collections.CookbookRecipes([], {cookbook: this}); 			
	},

	validate: function(){
		if(typeof(this.user_id) != "number"){
			return "something undefined";
		}
	}

});