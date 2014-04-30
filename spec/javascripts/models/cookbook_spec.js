describe('App.Models.Cookbook', function() {
  var cookbook;
	beforeEach(function(){
    cookbook = new App.Models.Cookbook(); 
    cookbook.set("notes", "");
    cookbook.set("saved_recipes", "");
	});

  it('should be defined', function() {
    expect(App.Models.Cookbook).toBeDefined();
  });

  it('can be instantiated', function() {
    expect(cookbook).not.toBeNull();
  });

  it('can belong to one user', function(){
    cookbook.set("user_id", 1);
    expect(cookbook.isValid(cookbook.attributes)).toEqual(true);
    cookbook.set("user_id", [1,2]);
    expect(cookbook.validate()).toEqual(false);
  });

  it('can have references to many recipes', function(){
    cookbook.recipes = ["recipe1", "recipe2"];
    expect(cookbook.isValid()).toEqual(true);
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

  xit ('should not allow for script injection with annotations', function(){

  });

  xit('should allow for custom organization of favorited recipes', function(){

  });


});