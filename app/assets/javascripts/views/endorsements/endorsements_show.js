App.Views.EndorsementsShow = Backbone.View.extend({

	template: JST["endorsements/show"],

	initialize: function(options){
		this.model = options.model;
	},
	
	render: function(){
		var content = this.template({endorsement: this.model})
		$(this.el).html(content);
		return this;
	}
});