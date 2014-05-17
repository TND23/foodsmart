App.Collections.Users = Backbone.Collection.extend({
	url: "/api/users",
	initialize: function(options){

	},

});

App.Collections.users = new App.Collections.Users();
App.Collections.users.fetch();