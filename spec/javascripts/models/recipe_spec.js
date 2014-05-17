describe('App.Models.Recipe', function(){
	var recipe = new App.Models.Recipe();
	var addIngredient = null;
	App.recipe = recipe;
		beforeEach(function(){
			recipe.set("id", "1");
			recipe.set("instructions", "These are the intsructions");
			recipe.set("user_id", "1");
			recipe.set("endorsements", {endorsement_id: 1, stars: 2, comments: "Nice work"});
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
		expect(recipe.get("dishname")).toEqual("pea soup");
	});

	it ('should have endorsements', function(){
		expect(recipe.get("Endorsements")).not.toBeNull();
	});
});