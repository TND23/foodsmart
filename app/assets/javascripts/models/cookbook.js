App.Models.Cookbook = Backbone.Model.extend({

	initialize: function(models, options){
		// this.user = options.user;
		this.cookbook_id = options.cookbook_id;
		this.cookbook_recipes = new App.Collections.CookbookRecipes([], {cookbook_id: options.cookbook_id});
	},

	validate: function(){
		if(typeof(this.user_id) != "number"){
			return "something undefined";
		}
	},
	
	urlRoot: function(){
		return "api/cookbooks/" + this.cookbook_id;
	} 
});