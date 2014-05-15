App.Collections.Users = Backbone.Collection.extend({
	url: "/api/users",
	initialize: function(){

	},

});

App.Collections.users = new App.Collections.Users();
App.Collections.users.fetch();