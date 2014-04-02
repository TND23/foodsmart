module Api

	class RecipesController < ApiController

		before_filter :require_user


		def index
			@recipes = Recipe.search(params[:search])
		
		end

		def new
			@recipe = Recipe.new
			3.times{ @recipe.ingredients.build }
		end

		def create
			@recipe = Recipe.new(recipe_params)
			names_hash = flatten_hash(recipe_params, "name")
			names = find_hash_vals(names_hash, "name")
			real_ingredients = []
			
			names.each do |possible_name|
				ing = Ingredient.find_by_name(possible_name)
				real_ingredients << ing
			end

			real_ingredients.each do |ing|
				@recipe.ingredients << ing if ing!= nil
			end

			@recipe.user_id = current_user.id
			@recipe.cookbook_id = current_user.cookbook.id
			if @recipe.save
				current_user.cookbook.add_recipe(@recipe.id)
				render :json => @recipe 
			else
				render :json => "#{recipe_params}" + "#{names}"  + "One or more fields were not filled out"
			end
		end

		def update
			if @recipe.save
				render :show
			else
				render :json => "Updating failed"
			end
		end

		def destroy

		end

		def show
			@recipe = Recipe.find(params[:id])
		end


		private

		def recipe_params
			params.require(:recipe).permit(
				:instructions, 
				:dishname, 
				:description,
				:recipe_ingredient_attributes => [
					:quantity,
					:optional,
					:ingredient_attributes => [:name]
				]
			)
	end

		def flatten_hash(hash, el)
			#recursively take away from the hash until it is composed only of items where 'el' maps to a value
			nested_item = hash
			hash.each_value { |v| nested_item = flatten_hash(v, el) if v.is_a?(Hash) && v[el].nil? }
			return nested_item
		end

		def find_hash_vals(hash, val)
			# return an array of the specified value
			arr = []
			hash.each do |k,v|
				if v[val]
					arr += v.values_at(val)
				end
			end
			arr
		end

	end
end