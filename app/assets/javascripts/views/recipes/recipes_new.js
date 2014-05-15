App.Views.RecipeNew = Backbone.View.extend({

	template: JST["recipes/new"],

	events: {
		'click .add-ingredient': 'addIngredientField'
	},

	addIngredientField: function(e){
		e.preventDefault();
		this.i += 1;
		var new_template = JST["recipes/_recipe_ingredient"];
		var content = new_template({i: this.i});
		$(content).insertBefore($("#last-ingredient"));
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