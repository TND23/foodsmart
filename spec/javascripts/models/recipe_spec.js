describe('App.Models.Recipe', function(){
	var recipe = new App.Models.Recipe();
	var addIngredient = null;
	App.recipe = recipe;
		beforeEach(function(){
			recipe.set("id", "1");
			recipe.set("instructions", "These are the intsructions");
			recipe.set("user_id", "1");
			recipe.set("dishname", "pea soup");
			recipe.set("description", "it smells like pea soup");
			recipe.set("recipe_ingredients", []);
			recipe._ingredient = recipe.attributes.recipe_ingredients;
			recipe.set("rated", false);
	})

	it('should be defined', function() {
      expect(App.Models.Recipe).toBeDefined();
  });

  it ('should know what _ingredient is', function(){
		expect(recipe._ingredient).toBeDefined();  	
  });

	it('has an ingredients relationship', function(){
		expect(recipe.recipeIngredients).toBeDefined();
		expect(recipe.attributes.recipe_ingredients).toBeDefined();
	}); 

	it ('should have a description', function(){
		expect(recipe).toBeDefined();
		expect(recipe.attributes.dishname).toEqual("pea soup");
	});

	it ('should have endorsements', function(){
		expect(recipe.endorsements).toBeDefined();
	});

	it ('should have a model', function(){
		expect(recipe.model).toBeDefined();
	});

	it ('has a working calculate rating function', function(){
			recipe.set("endorsements", 
				[{"id":1,"comments":"This is certainly a recipe.","stars":3,"recipe_id":1,"user_id":2},
				{"id":2,"comments":"This is certainly a recipe.","stars":2,"recipe_id":1,"user_id":3}]
			);
		expect(recipe.calculateRating).toBeDefined();
		expect(recipe.calculateRating()).toEqual(2.5);
		recipe.set("endorsements", []);
		expect(recipe.calculateRating()).toEqual(null);
	});

	it ('has an ingredients filter', function(){
		var stub = sinon.stub(this.rating);
		expect(recipe.filterByName).toBeDefined();
	});

	it ('has recipe ingredients', function(){
		expect(recipe.recipeIngredients).toBeDefined();
	});
	
	it ('has an add ingredients function', function(){
		expect(recipe.addIngredients).toBeDefined();
		expect(recipe.addIngredient).toBeDefined();
	});

	it ('correctly updates fields after ratings happen', function(){
		expect(recipe.attributes.rated).toEqual(false);
		recipe.set("endorsements", [{"id":1,"comments":"This is certainly a recipe.","stars":3,"recipe_id":1,"user_id":2},
											{"id":2,"comments":"This is certainly a recipe.","stars":2,"recipe_id":1,"user_id":3}]);
		//should sync
		recipe.calculateRating();
		expect(recipe.attributes.rated).toEqual(true);
	});


	it('Should be able to add multiple ingredients', function(){
		var callback = recipe.addIngredient;
		recipe.addIngredients([
			{"name":'prosciutto',"description":"Quite salty and good","units": 'slices',"quantity":2.0},
		  {"name": 'tomato',"description":"Red and flavorful.","units": 'pounds',"quantity":1.0}
		]);
		expect(recipe.attributes.recipe_ingredients).toEqual([ { name : 'prosciutto', description : 'Quite salty and good', units : 'slices', quantity : 2 }, { name : 'tomato', description : 'Red and flavorful.', units : 'pounds', quantity : 1 } ]);
		expect(callback.calledTwice);
	});
	

	it('Should be able to remove ingredients', function(){
		expect(recipe.removeIngredients).toBeDefined();
		recipe.save();
		recipe.addIngredients([
			{"name":'prosciutto',"description":"Quite salty and good","units": 'slices',"quantity":2.0},
		  {"name": 'tomato',"description":"Red and flavorful.","units": 'pounds',"quantity":1.0}
		]);

		recipe.removeIngredients(["tomato", "prosciutto"]);
		expect(recipe.attributes.recipe_ingredients).toEqual([]);

	});
});