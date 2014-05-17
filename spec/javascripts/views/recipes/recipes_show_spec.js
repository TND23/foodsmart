describe ('App.Views.RecipesIndex', function(){


	beforeEach(function(){
		this.server = sinon.fakeServer.create();
		this.view = new App.Views.RecipesIndex();
	});

	// it('should have a search function', function(){

	// });

	// it ('has a working calculate rating function', function(){
	// 		recipe.set("endorsements", 
	// 			[{"id":1,"comments":"This is certainly a recipe.","stars":3,"recipe_id":1,"user_id":2},
	// 			{"id":2,"comments":"This is certainly a recipe.","stars":2,"recipe_id":1,"user_id":3}]
	// 		);
	// 	expect(recipe.calculateRating).toBeDefined();
	// 	expect(recipe.calculateRating()).toEqual(2.5);
	// 	recipe.set("endorsements", []);
	// 	expect(recipe.calculateRating()).toEqual(null);
	// });

	// it ('has an ingredients filter', function(){
	// 	var stub = sinon.stub(this.rating);
	// 	expect(recipe.filterByName).toBeDefined();
	// });



	// it ('has recipe ingredients', function(){
	// 	expect(recipe.recipeIngredients).toBeDefined();
	// });
	
	// it ('has an add ingredients function', function(){
	// 	expect(recipe.addIngredients).toBeDefined();
	// 	expect(recipe.addIngredient).toBeDefined();
	// });

	// it ('correctly updates fields after ratings happen', function(){
	// 	expect(recipe.attributes.rated).toEqual(false);
	// 	recipe.set("endorsements", [{"id":1,"comments":"This is certainly a recipe.","stars":3,"recipe_id":1,"user_id":2},
	// 										{"id":2,"comments":"This is certainly a recipe.","stars":2,"recipe_id":1,"user_id":3}]);
	// 	//should sync
	// 	recipe.calculateRating();
	// 	expect(recipe.attributes.rated).toEqual(true);
	// });


	// it('Should be able to add multiple ingredients', function(){
	// 	var callback = recipe.addIngredient;
	// 	recipe.addIngredients([
	// 		{"name":'prosciutto',"description":"Quite salty and good","units": 'slices',"quantity":2.0},
	// 	  {"name": 'tomato',"description":"Red and flavorful.","units": 'pounds',"quantity":1.0}
	// 	]);
	// 	expect(recipe.attributes.recipe_ingredients).toEqual([ { name : 'prosciutto', description : 'Quite salty and good', units : 'slices', quantity : 2 }, { name : 'tomato', description : 'Red and flavorful.', units : 'pounds', quantity : 1 } ]);
	// 	expect(callback.calledTwice);
	// });
	

	// it('Should be able to remove ingredients', function(){
	// 	expect(recipe.removeIngredients).toBeDefined();
	// 	recipe.save();
	// 	recipe.addIngredients([
	// 		{"name":'prosciutto',"description":"Quite salty and good","units": 'slices',"quantity":2.0},
	// 	  {"name": 'tomato',"description":"Red and flavorful.","units": 'pounds',"quantity":1.0}
	// 	]);

	// 	recipe.removeIngredients(["tomato", "prosciutto"]);
	// 	expect(recipe.attributes.recipe_ingredients).toEqual([]);

	// });
	//
	// it('should default to searching by name', function(){

	// });

	xit('should gracefully degrade if no similar name exists', function(){

	});

	xit('should be able to search by rating: high to low', function(){

	});

	xit('should give consistent results for rating searches', function(){

	});

	xit('should be able to search by recipe author', function(){

	});

	xit('should gracefully degrade if no author is found', function(){

	});

	xit('should be able to have more than one parameter at a time', function(){

	});

	xit('should allow for searching by recipe name and rating', function(){

	});

	xit('should allow for searching by recipe author and rating', function(){

	});

	xit('should allow for searching by recipe author and recipe name', function(){

	});

});
