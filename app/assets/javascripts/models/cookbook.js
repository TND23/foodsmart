App.Models.Cookbook = Backbone.Model.extend({

	initialize: function(models, options){
		this.user_id = options.user.id
		//this.saved_recipes = new App.Collections.Recipes([], {cookbook: this});

	},

	addRecipe: function(recipe_id){
		var recipe = Recipe.find(recipe_id);
		if (this.saved_recipes === undefined){
			this.attributes.saved_recipes = {};
		}
		if (_.has(this.attributes.saved_recipes, recipe_id)){
			return "recipe already exists in cookbook";
		}
		if (recipe === undefined){
			return "could not find the added recipe";
		}
		else{

		}
	},

	saved_recipes: function(){
		if (!this._saved_recipes){
			this._saved_recipes = {};
		}
		return this._saved_recipes;
	},

	validate: function(){
		if (typeof(this.attributes.user_id) != 'number'){
			return false;
		}
	}
});