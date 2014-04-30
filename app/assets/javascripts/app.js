window.App = {
	Models: {},
	Collections: {},
	Routers: {},
	Views: {},
	Forms: {},
	
	initialize: function(){
		new App.Routers.AppRouter();
		App.token = $('meta[name="csrf-token"]').attr('content');

		Backbone.history.start();
	}
};