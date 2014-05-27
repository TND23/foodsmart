App.Views.RecipesShow = Backbone.View.extend({

	template: JST['recipes/pager']

	initialize: function(collection){
		
	},

	events: {
		'click #edit-name' : 'updateName',
		'click .recipe-row' : 'addStyle',
	},

	render: function(){		
		var content = this.template({recipe: this.model})
		$(this.el).html(content);
		return this;
	},
});