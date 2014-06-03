App.Views.RecipesPaginator = Backbone.View.extend({

	template: JST['recipes/paginator'],

	initialize: function(options){
		this.state = options.state;
	},

	events: {
		'click .prev' : 'navigatePrev',
		'click .next' : 'navigateNext',
	},

	navigateNext: function(){
		
	},

	navigatePrev: function(){
		console.log("prev");
	},

	render: function(){		
		var content = this.template({state: this.state});
		$(this.el).html(content);
		return this;
	},
});