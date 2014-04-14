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
			recipe.set("recipe_ingredients", ["cheese, bread, tomato sauce"]);
			recipe.set("endorsements", [{"id":1,"comments":"This is certainly a recipe.","stars":3,"recipe_id":1,"user_id":2},
											{"id":2,"comments":"This is certainly a recipe.","stars":2,"recipe_id":1,"user_id":3}]);
			// recipe.set("rated", false);
			// recipe.set("rating", null);
			// recipe.set("ingredients", []);
			// recipe.addIngredient = function(ingredient_name){
			// 	this.attributes.ingredients.push(ingredient_name);
			// };

			// recipe.addRating = function(rating){
			// 	this.attributes.rating.push(rating.to_f);
			// };
	})

	it('should be defined', function() {
      expect(App.Models.Cookbook).toBeDefined();
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
		expect(recipe.addIngredient).toBeDefined();
	});

	// it ('has a default false rated attribute', function(){
	// 	expect(recipe.attributes.rated).toEqual(false);
	// });

	// it ('correctly updates fields after ratings happen', function(){
	// 	recipe.addRating(3.0);
	// 	expect(recipe.attributes.rated).toEqual(true);
	// 	expect(recipe.attributes.rating).toEqual(3.0);
	// });

	it ('correctly updates ingredients after changes', function(){
		recipe.attributes.recipe_ingredients = [];
		recipe.addIngredient("toast");
		// expect(recipe.attributes.ingredients).toBeDefined();
		// expect(recipe.attributes.ingredients).toEqual("toast");
	})



});
