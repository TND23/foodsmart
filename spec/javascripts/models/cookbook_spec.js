describe('App.Models.Cookbook', function() {
	var cookbook;
	beforeEach(function(){
		cookbook = new App.Models.Cookbook(); 
	});

  it('should be defined', function() {
      expect(App.Models.Cookbook).toBeDefined();
  });

  it('can be instantiated', function() {
      expect(cookbook).not.toBeNull();
  });

  it ('should have add recipe function', function(){
  	expect(cookbook.addRecipe).toBeDefined();
  });

  it ('should have remove recipe function', function(){
  	expect(cookbook.removeRecipe).toBeDefined();
  });

  it ('should have annotate recipe function', function(){
  	expect(cookbook.annotateRecipe).toBeDefined();
  });

  
});