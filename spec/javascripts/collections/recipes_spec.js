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

	it('should have a search function', function(){

	});

	it('should default to searching by name', function(){

	});

	// more advanced logic for later
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