module Api
	class RecipesController < ApiController
		before_filter :require_user
		skip_before_filter :verify_authenticity_token, :only => :create
		def index
			# @recipes = Recipe.search(params[:search])
			@recipes = Recipe.all
			@recipes.each do |recipe|
				recipe.recipe_ingredients.each do |ri|
					if !ri.name
						ri.name = ri.ingredient.name
					end
					if !ri.description
						ri.description = ri.ingredient.description
					end
				end
			end
			render "api/recipes/index"
		end

		def new
			@recipe = Recipe.new
			render "api/recipes/new.html.erb"
			3.times{ @recipe.ingredients.build }
		end

		def create
			@recipe = Recipe.new(recipe_params)
			@recipe.user_id = current_user.id

			# names_hash = flatten_hash(recipe_params, "name")
			# names = find_hash_vals(names_hash, "name")
			# real_ingredients = []
			
			# names.each do |possible_name|
			# 	ing = Ingredient.find_by_name(possible_name)
			# 	real_ingredients << ing
			# end

			# real_ingredients.each do |ing|
			# 	@recipe.ingredients << ing if ing!= nil
			# end

			# @recipe.user_id = current_user.id
			if @recipe.save
				_render(@recipe)
			#	render :json => @recipe 
			end
		end

		# TODO
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


			render "api/recipes/show"
		end

		private
		def recipe_params
			#if recipe is defined we fetch it, otherwise set default value to {}
			params.fetch(:recipe, {}).permit(
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

		def _render(models)
			render :json => models
		end
		
	end
end

