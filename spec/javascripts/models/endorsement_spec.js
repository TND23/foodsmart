describe('App.Models.Endorsement', function(){
		var endorsement;
		beforeEach(function(){
			endorsement = new App.Models.Endorsement([], {recipe_id: 1});
		});

		it ("should have a duplication checking function", function(){
			expect(endorsement.checkDuplication).toBeDefined();
		});

		it ("should not be able to belong to the recipes owner", function(){
				
		});

		xit ("should have comments", function(){

		});

		xit("should only allow for one endorsement per person per recipe", function(){

		});

		xit("should have a rating in stars", function(){

		});

		xit('should belong to a recipe', function(){

		});

		xit('should be editable by the owner', function(){

		});

		xit('should be removable by the owner', function(){

		});

		
});