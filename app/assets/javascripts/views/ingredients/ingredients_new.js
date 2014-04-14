App.Views.IngredientsNew = Backbone.View.extend({

	template: JST["ingredients/new"],
	initialize: function(){},
	render: function(){ $("body").append(this.template); }

});