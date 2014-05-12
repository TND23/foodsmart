App.Views.RecipeNew = Backbone.View.extend({

	template: JST["recipes/new"],

	events: {
		'click #submitter': 'submitRecipe',
		'click .add-ingredient': 'addIngredientField'
	},

	initialize: function(){
		this.render();
		this.i = 1;
	},

	render: function(){
		var content = this.template();
		$(this.el).html(content);
		return this;
	},

	submitRecipe: function(e){
		
	},

	addIngredientField: function(e){
		e.preventDefault();
		this.i += 1;
		var new_template = JST["recipes/_recipe_ingredient"];
		var content = new_template({i: this.i});
		$(content).insertBefore($("#last-ingredient"));
	}

});