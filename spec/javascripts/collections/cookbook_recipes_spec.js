describe('App.Collections.CookbookRecipes', function(){
	beforeEach(function(){

	});

	xit ('should have add recipe function', function(){
  	expect(cookbook.addRecipe).toBeDefined();
  });

  xit ('should have remove recipe function', function(){
  	expect(cookbook.removeRecipe).toBeDefined();
  });

  xit ('should have annotate recipe function', function(){
  	expect(cookbook.annotateRecipe).toBeDefined();
  });

  xit('should allow for seperation of authors recipes and favorited recipes', function(){
    expect(cookbook.organizeRecipes).toBeDefined();
  });

  xit('should allow for custom organization of favorited recipes', function(){

  });
});