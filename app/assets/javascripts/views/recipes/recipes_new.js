App.Views.RecipeNew = Backbone.View.extend({

	template: JST["recipes/new"],

	events: {
		'click .add-ingredient': 'addIngredientField',
		'click #check': 'findGivenIngredients'
	},

	addIngredientField: function(e){
		e.preventDefault();
		this.i += 1;
		var new_template = JST["recipes/_recipe_ingredient"];
		var content = new_template({i: this.i});
		$(content).insertBefore($("#last-ingredient"));
	},

	findGivenIngredients: function(){
		// this is going to need major fixing
		var current_names = this.getIngredientNames();
		var valid_names = [];
		current_names.forEach( function(name){
			var temp = App.Collections.ingredients.findWhere({name: name});
			if (temp !== undefined){
				valid_names.push(temp);
			}
		})
		this.$el.append(current_names);
	},

	getIngredientNames: function(){	
		var nameArray = [];
		_.each($(".recipe_ingredient_name"), function(name){
			nameArray.push(name.value);
		});
		return nameArray;
	},

	initialize: function(){
		this.render();
		this.i = 1;
	},

	render: function(){
		var content = this.template();
		$(this.el).html(content);
		return this;
	}
});