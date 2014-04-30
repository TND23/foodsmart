App.Models.Cookbook = Backbone.Model.extend({
	
	urlRoot: function(arguments){
		return "/api/cookbooks"; 
	},
	
	initialize: function(){
		this.attributes.saved_recipes = {};
		this.saved_recipes();
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

	annotateRecipe: function(){
		
	},

	organizeRecipes: function(){

	},

	removeRecipe: function(){

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