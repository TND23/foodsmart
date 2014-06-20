App.Models.Recipe = Backbone.Model.extend({
	
	defaults: {
		instructions: "Default recipe instructions",
		description: "Default recipe description",
		dishname: "Default recipe dishname",
	},

	initialize: function(models, options){ 
		// var that = this;
		this.recipe_ingredients = [];
		this.endorsements = new App.Collections.Endorsements([], {recipe: this});
	//	this.endorsements.fetch();
		// this.bind("sync", that.setEndorsement, this);
	//	this.recipe_ingredients = new App.Collections.RecipeIngredients();
	},

	parse: function(res){
		for (var key in this.model){
			var embeddedClass = this.model[key];
			var embeddedData = res[key];
			res[key] = new embeddedClass(embeddedData, {parse: true});	
		}
	//	res.endorsements = new App.Collections.Endorsements([], {recipe: this});
		return res;
	},

	recipeIngredients: function(){
		if (typeof(this._ingredients) === undefined){
			this._ingredients = this.attributes.recipe_ingredients;
		}
		return this._ingredients;
	}
});