window.App = {
	Models: {},
	Collections: {},
	Routers: {},
	Views: {},
	Forms: {},
	
	initialize: function(){

		ENTER_KEY = 13;
		if (!Backbone.History.started){
			new App.Routers.AppRouter();
			App.token = $('meta[name="csrf-token"]').attr('content');
			Backbone.history.start();
		}
	}
};