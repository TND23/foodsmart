App.Views.RecipeNew = Backbone.View.extend({

	template: JST["recipes/new"],

	events: {
		'click #submitter': 'submitRecipe'
	},

	initialize: function(){
		this.render();
	},

	render: function(){
		var content = this.template();
		$(this.el).html(content);
		return this;
	},

	submitRecipe: function(e){
		
	}

});