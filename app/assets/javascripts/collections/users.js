App.Collections.Users = Backbone.Collection.extend({
	url: "api/users",
	model: App.Models.User,
	initialize: function(options){

	}

});

// speed it up by a factor of N
// App.Collections.users = new App.Collections.Users();
// App.Collections.users.fetch();