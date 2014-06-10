App.Models.Cookbook = Backbone.Model.extend({

	initialize: function(models, options){
		this.user_id = options.user.id;
		var cookbook_id = options.cookbook_id;
		this.cookbook_recipes = new App.Collections.CookbookRecipes([], {cookbook_id: options.cookbook_id});
		// default cookbook_recipes to have 1 model
		//this.set("cookbook_recipes", new App.Collections.CookbookRecipes([], {cookbook_id: options.cookbook_id})); 			
	},

	validate: function(){

		if(typeof(this.user_id) != "number"){
			return "something undefined";
		}
	},
	urlRoot: "api/cookbooks/"
});