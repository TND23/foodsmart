App.Models.Current_user = Backbone.Model.extend({

	initialize: function(options){
		this.id = options.id;
	},
	urlRoot: "/api/users"
})