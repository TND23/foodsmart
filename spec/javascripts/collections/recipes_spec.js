describe('App.Collections.Recipes', function(){
	var recipes;

	beforeEach(function(){
		this.server = sinon.fakeServer.create();
		recipes = new App.Collections.Recipes();
	});

	afterEach(function(){
		this.server.restore();
	});

	it('should make a valid request', function(){
		recipes.fetch();
		expect(this.server.requests.length).toEqual(1);
	});

	it('should have many recipe models', function(){
		expect(recipes.models).toBeDefined();
	});

	xit('should not have any two with the same name', function(){
		
	});
});