describe('App.Collections.Recipes', function(){
	var recipes;

	beforeEach(function(){
		this.server = sinon.fakeServer.create();
		this.recipes = new App.Collections.Recipes();
	});

	afterEach(function(){
		this.server.restore();
	});

	it('should make a valid request', function(){
		this.recipes.fetch();
		expect(this.server.requests.length).toEqual(1);
	});

	it('should have many recipe models', function(){
		expect(this.recipes.models.length).toBeGreaterThan(0);
	});

	it('should not have any two with the same name', function(){
		
	});


});