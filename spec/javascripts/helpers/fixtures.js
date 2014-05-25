var ingredientsResponse =  [
    { id: 1, name: 'Mustard', description: "Delicious mustard" },
    { id: 2, name: 'Pickle', description: "Delciious pickle" }
];

var recipesResponse =  [ 
		{ id: 1, instructions: "A description of how to make a simple burger.",
     dishname: 'Simple Hamburger', 
     description: "Delicious mustard",
     user_id: 1,
     rating: 5.0,
     rated: true  },
    { id: 2, 
    	instructions: "Eye of toad, throat of goat, tail of newt and a sliver of pickle.", 
    	dishname: 'Pickled newt',
    	user_id: 4, 
    	description: "A staple for any self-proclaimed witch.",
    	rating: null,
    	rated: false },
    { id: 3, 
    	instructions: "Lorem ipsum", 
    	dishname: "Id aut est repellendus aut inventore occaecati. Illo sit ut vitae id. Est corporis suscipit rerum perferendis. io est velit nihil.",
    	user_id: 1, 
    	description:  "Necessitatibus mollitia earum est. Dicta sunt debitis voluptas. Rerum ullam tempora repellat velit saepe voluptem. Veniam provident quibusdam similique. Ratione aut laborum saepe sit qui.",
    	rating: null,
    	rated: false }
	];

var usersResponse = [
	{id: 1, username: 'User1', admin: true},
	{id: 2, username: 'User2', admin: false },
	{id: 3, username: 'User3', admin: false },
	{id: 4, username: 'User4', admin: false },
];

var cookbookResponse = {id: 1, user_id: 1, cookbook_recipes: []};

var cookbookRecipesResponse = [{id: 1, models: {1: {cookbook_id: 1, recipe_id: 1, notes: 'Add cheese for great effect'},
 2:{cookbook_id: 1, recipe_id: 2, notes: 'This does not taste the best'} } }];

cookbookResponse.cookbook_recipes = cookbookRecipesResponse;

// legal endorsements
// var endorsementsResponse =  [ 
// 		{ id: 1, stars: 5, recipe_id: 1, user_id: 4, comments: "Very good."},
//     { id: 2, stars: 4, recipe_id: 1, user_id: 3, comments: "Quite good."}
// ];


beforeEach(function(){

	this.server = sinon.fakeServer.create();

	this.server.respondWith('GET', 'api/ingredients', 
		[ 200, 
			{ "Content-Type": "application/json" },
			JSON.stringify(ingredientsResponse) 
		]
	);

	this.server.respondWith('GET', 'api/recipes', 
		[	200, 
			{ "Content-Type": "application/json" },
		 	JSON.stringify(recipesResponse) 
		]
	);

	this.server.respondWith('GET', 'api/users', 
		[ 200, 
			{ "Content-Type": "application/json" },
	 		JSON.stringify(usersResponse) 
		]
	);

	this.server.respondWith('GET', 'api/cookbooks', 
		[ 200, 
			{ "Content-Type": "application/json" },
	 		JSON.stringify(cookbookResponse) 
		]
	);



	App.Collections.ingredients = new App.Collections.Ingredients();
	App.Collections.recipes =  new App.Collections.Recipes();
	App.Collections.users = new App.Collections.Users();

	App.Collections.ingredients.fetch();
	App.Collections.recipes.fetch();
	App.Collections.users.fetch();

	this.server.respond();
});