App.Models.Recipe = Backbone.Model.extend({

	urlRoot: "/api/recipes",
	
	model: { endorsement: App.Models.Endorsement },

	parse: function(res){
		for (var key in this.model){
			var embeddedClass = this.model[key];
			var embeddedData = res[key];
			res[key] = new embeddedClass(embeddedData, {parse: true});	
		}
		return res;
	},

	initialize: function(models, options){ 
		var that = this;
		this.on('save', function(){
			that.recipeIngredients();
		});
	},

	defaults: {
		instructions: "Write me!",
		description: "Write me!",
		dishname: "Write me!",
		recipe_ingredients: []
	},

	addIngredient: function(ingredient){
		// if the ingredients list is non-empty, look for duplicates
		if (this.hasIngredient(ingredient.name) === false){
			this.attributes.recipe_ingredients.push(ingredient); 
		}
		else { return false; } 
	},

	addIngredients: function(ingredientList){
		var that = this;
		_.each(ingredientList, function(ingredient){
			that.addIngredient(ingredient);
		})
		this.save();
		return this.attributes.recipe_ingredients;
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
		this.ingredients.filter(function(model){
			if (model.name == ingredient_name){
				return model;
			}
		})	
	},

	hasIngredient: function(name){
		if (this.attributes.recipe_ingredients.length > 0){
			_.each(this.attributes.recipe_ingredients, function(recipe_ingredient){
				if (_.has(_.values(recipe_ingredient), name) === true){ 
					return true;
				}		
			});
		}
		return false;
	},
	//refactor such that we attributes.recipe_ingredients = _ingredients

	recipeIngredients: function(){
		if (typeof(this._ingredients) === undefined){
			this._ingredients = this.attributes.recipe_ingredients;
		}
		return this._ingredients;
	},

	removeIngredient: function(ingredient){
		var new_recipe_ingredients = [];
		_.each(this.attributes.recipe_ingredients, function(ri){
			if (_.values(ri)[0] != ingredient){
				new_recipe_ingredients.push(ri);
			}
		})
		this.attributes.recipe_ingredients = new_recipe_ingredients;
	},

	removeIngredients: function(ingredientList){
		var that = this;
		// make this better than m*n
		// if the list does contain the elemnt,
		// remove it.
		_.each(ingredientList, function(ingredient){
			that.removeIngredient(ingredient);
		});
	}
});