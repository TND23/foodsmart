App.Models.Recipe = Backbone.Model.extend({

	urlRoot: "/api/recipes",
	
	model: {
		endorsement: App.Models.Endorsement
	},

	schema: {
		dishname: 'Text',
		description: 'Text',
		instructions: 'Text',
		ingredients: { type: 'List', itemType: 'Text' }
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
		// This must be a collection of user-ingredients.
		recipe_ingredients: []
	},

	// Change this to an options hash.
	addIngredient: function(ingredient_name, quantity, units){
		// If the recipe does not have an ingredient of the passed in name.
		var that = this;
		var recipe_ingredients = this.attributes.recipe_ingredients;
		if (recipe_ingredients.length > 1){
			recipe_ingredients.forEach(function(ri){
				if (ingredient_name === ri.name){
					// If the ingredient is already in here,  edit the ingredient.
				} else {
					// This will get slow quickly.
					var parent_ingredient = App.Collections.ingredients.where({"name": ingredient_name});
					if(parent_ingredient === undefined){
						
					} else {
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
			if (!this.attributes.rated){
				this.attributes.rated = true;
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