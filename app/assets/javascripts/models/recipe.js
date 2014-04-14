App.Models.Recipe = Backbone.Model.extend({

	urlRoot: "/api/recipes",
	
	model: {
		endorsement: App.Models.Endorsement
	},

	schema: {
		dishname: 'Text',
		description: 'Text',
		instructions: 'Text',
	},

	parse: function(res){
		for (var key in this.model){
			var embeddedClass = this.model[key];
			var embeddedData = res[key];
			res[key] = new embeddedClass(embeddedData, {parse: true});	
		}
		return res;
	},

	initialize: function(models, options){

	},

	defaults:{
		instructions: "Write me!",
		description: "Write me!",
		dishname: "Write me!",
		recipe_ingredients: []
	},

	// change to options
	addIngredient: function(ingredient_name, quantity, units){
		// if the recipe does not have an ingredient of the passed in name
		var recipe_ingredients = this.attributes.recipe_ingredients;
		if (recipe_ingredients.length > 1){
			recipe_ingredients.forEach(function(ri){
				if (ingredient_name === ri.name){
					//prompt editing
				} else {
					var parent_ingredient = App.Collections.ingredients.where({"name": ingredient_name});
					if(parent_ingredient === undefined){
						// wing it
					} else{
						recipeIngredify(ingredient_name, quantity, units);
					}
					
				}
			});
		}
	},

	calculateRating: function(){
		var sum = 0;
		var endorsements = this.attributes.endorsements;
		if(endorsements.length < 1){
			return null;
		} else {
			if (!this.rated){
				this.rated = true;
			}
			endorsements.forEach(function(endorsement){
				sum += endorsement.stars;
			});
			return sum/endorsements.length;
		}
	},

	endorsements: function(){
		if (!this._endorsements){
			this._endorsements = new App.Collections.Endorsements([], {recipe: this})
		}
	},

	filterByName: function(ingredient_name){
		// find ingredients in our recipe
		this.ingredients.filter(function(model){
			if (model.name == ingredient_name){
				return model;
			}
		})	
	},

	getName: function(){
		return this.get('name');
	},

	recipeIngredients: function(){
		if (typeof(this._ingredients) === undefined){
			this._ingredients = this.attributes.recipe_ingredients;
		}
		return this._ingredients;
	},

	recipeIngredify: function(ingredient){

	}

});