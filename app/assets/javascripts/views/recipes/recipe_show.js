App.Views.RecipesShow = Backbone.View.extend({
	template: JST["recipes/show"],

	events: {
		'click #edit-name' : 'updateName',
		'click .recipe-row' : 'addStyle',
		'keypress .recipe-row' : 'updateOnEnter',
		'blur .recipe-row' : 'removeStyle',
		'click .add-ingredient': 'addIngredientField',
		'click #edit-description': 'editDescription'
	},

	addIngredientField: function(e){
		e.preventDefault();
		this.i += 1;
		var new_template = JST["recipes/_recipe_ingredient"];
		var content = new_template({i: this.i});
		$(content).insertBefore($("#last-ingredient"));
	},

	addStyle: function(e){
		var el = e.currentTarget;
		$(el).addClass("editable");
	},

	close: function(e){
		var options = this.getDiv(e);
		var value = options.el.value.trim();
		var model = options.list[0];
		var el = e.currentTarget;
		$(el).removeClass("editable");
		model.set("dishname", value); 
		model.save();
	},

	editDescription: function(){
		
	},

	getDiv: function(e){
		var target = e.target;
		var domIdVal = e.target.id;
		var list_id = parseInt(domIdVal.match(/\d+/));
		var curr_list = Lists.where({id: list_id});
		return {list: curr_list, el: target};
	},


	initialize: function(options){
		this.model = options.model[0];
	},	

	removeStyle: function(e){
		var el = e.currentTarget;
		$(el).removeClass("editable");
	},

	render: function(){		
		var content = this.template({recipe: this.model})
		$(this.el).html(content);
		return this;
	},

	updateName: function(){
		$dishname = $("#dishname").val();
		this.model.set("dishname", $dishname);
		console.log(this.model);
		this.model.save();
	},

	updateOnEnter: function(e){
		if (e.which === ENTER_KEY){
			this.close(e);
		}
	}

});