describe('App.Models.Cookbook', function() {
  var cookbook;

	beforeEach(function(){
    var user = App.Collections.users.models[0];
    cookbook = new App.Models.Cookbook([], {user: user}); 
    cookbook.set("notes", "");
    cookbook.set("saved_recipes", "");
	});

  it('should be defined', function() {
    expect(App.Models.Cookbook).toBeDefined();
  });

  it('can be instantiated', function() {
    expect(cookbook).not.toBeNull();
  });

  it('should have a cookbook_recipes collection', function(){
    expect(cookbook.cookbook_recipes).toBeDefined();
  });

  it('can belong to one and only one user', function(){
    cookbook.user_id = [1,2];
    expect(cookbook.validate()).toEqual("something undefined");
  });

  it('can have references to many recipes', function(){
    cookbook.cookbook_recipes = [["recipe1", "recipe2"]];
    expect(cookbook.isValid()).toBeTruthy();
  });

});