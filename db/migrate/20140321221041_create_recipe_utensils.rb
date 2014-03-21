class CreateRecipeUtensils < ActiveRecord::Migration
  def change
    create_table :recipe_utensils do |t|
    	t.integer :recipe_id
    	t.integer :utensil_id
    end
  end
end
