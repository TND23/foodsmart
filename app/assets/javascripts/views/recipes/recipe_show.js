App.Views.RecipesShow = Backbone.View.extend({
	template: JST["recipes/show"],

// pagination strategy
// record no of items total, page length, current index, and the items
	events: {
		'click #edit-name' : 'updateName',
		'click .recipe-row' : 'addStyle',
		'click #endorse' : 'endorse',
		'click .save-recipe' : 'saveRecipe',
		'keypress .recipe-row' : 'updateOnEnter',
		'blur .recipe-row' : 'removeStyle',
		'click .add-ingredient': 'addIngredientField',
		'click .remove-ingredient': 'removeIngredientField',
		'click #edit-description': 'editDescription',
		'mouseover .fa-star' : 'highlightUpTo',
		'click .fa-star' : 'setStars',
		'mouseout #all-stars' : 'unhighlightAll',
	},

	convertIdToInt: function(e){
		var div = this.getDiv(e);
		var num = parseInt(div);
		return num;
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
		var attribute = this.getDiv(e);
		// grab the value from the DOM element 
		var value = $("#"+attribute).val().trim();
		var el = e.currentTarget;
		$(el).removeClass("editable");
		this.model.set(attribute, value); 
		this.model.save();
	},

	ensureEndorsements: function(recipe){
		if(typeof(recipe.endorsements) === "undefined"){ 
			var new_endorsements =  new App.Collections.Endorsements({recipe: recipe}); 
			recipe.endorsements = new_endorsements 
			recipe.save(); 
 		} 
	},

	endorse: function(e){
		e.preventDefault();
		var comments = $(".immutable-mid-textarea").val();
		if(comments === "" || !this.stars){
			return;
		} else {
			var that = this;
			var endorsement = new App.Models.Endorsement({user_id: App.current_user.id, recipe_id: that.model.id});
			endorsement.set("stars", that.stars);
			endorsement.set("comments", comments);
			endorsement.save(endorsement.attributes, { success: function(){
				that.model.endorsements.add(endorsement);
				}
			});			
		}
	},

	getDiv: function(e){
		// Grab the event targets id. It will correspond with a model attribute
		var target = e.target;
		var domIdVal = e.target.id;
		return domIdVal;
	},

	highlightUpTo: function(e){
		// get all stars from 1 to the selected stars id
		var num = this.convertIdToInt(e);
		if(!this.stars){
			for (var i = 1; i <= num; i++){
				$("#"+i).addClass('yellow-color');		
				$("#"+i).removeClass('ninja');
			}			
		}
	},	

	initialize: function(options){
		var view = this;
		var model = this.model = options.model;
		this.ensureEndorsements(options.model);
		this.listenTo(model.endorsements, 'add', view.renderEndorsementsPartial)
	},	

	removeIngredientField: function(e){
		alert("HEHEHEHEHE");
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

	renderPartial: function(view){
//		$(".container").append(view.$el);
	},

	renderEndorsementsPartial: function(){
		var that = this;
		var newView = new App.Views.EndorsementsShow({model: that.model.endorsements.last()});
		var content = newView.render();
		$("#endorsements-row").append(content.$el);
//		$(".container").append(view.$el);
	},

	saveRecipe: function(e){
		e.preventDefault();
		var that = this;
		var userCookbook = App.current_user.get("cookbook");
		if (_.isEmpty(userCookbook.cookbook_recipes)){
			
		}
		if (userCookbook.cookbook_recipes.findWhere({"dishname": that.model.escape("dishname")})){
			console.log("That dishname already exists in your cookbook!");
		} else {
			userCookbook.cookbook_recipes.add(this.model);
		}
	},

	setStars: function(e){
		this.stars = this.convertIdToInt(e);
		for (var i = 1; i <= this.stars; i++){
				$("#"+i).addClass('yellow-color');		
				$("#"+i).removeClass('ninja');
			}
		if(this.stars < 5){
			for (var i = this.stars+1; i <= 5; i++){
				$("#"+i).addClass('ninja');		
				$("#"+i).removeClass('yellow-color');
			}							
		}
	},

	unhighlightAll: function(){
		if (!this.stars){
			for (var i = 1; i <= 5; i++){
				$("#"+i).removeClass('yellow-color');		
				$("#"+i).addClass('ninja');
			}	
		}
	},	

	updateName: function(){
		$dishname = $("#dishname").val();
		this.model.set("dishname", $dishname);
		this.model.save();
	},

	updateOnEnter: function(e){
		if (e.which === ENTER_KEY){
			this.close(e);
		}
	}

});