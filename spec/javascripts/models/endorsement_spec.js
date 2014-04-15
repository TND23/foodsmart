describe('App.Models.Endorsement', function(){
		var endorsement;
		beforeEach(function(){
			endorsement = new App.Models.Endorsement([], {recipe_id: 1});
		});

		it ("should have a duplication checking function", function(){
			expect(endorsement.checkDuplication).toBeDefined();
		});

		it ("should not be able to belong ot the recipes owner", function(){
			expect(endorsement.)
		})
});