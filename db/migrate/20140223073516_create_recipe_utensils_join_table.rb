class CreateRecipeUtensilsJoinTable < ActiveRecord::Migration
  def change
  	  	create_table :recipes_utensils, id: false do |t|
  		t.integer :recipe_id
  		t.integer :utensil_id
  	end
  end
end
