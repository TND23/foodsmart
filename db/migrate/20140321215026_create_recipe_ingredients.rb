class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
    	t.integer :recipe_id, :null => false
    	t.integer :ingredient_id, :null => false
      t.string :name, :null => false
      t.string :description
    	t.float :quantity
    	t.string :units
    	t.boolean :optional, :default => false
      t.timestamps
    end
  end
end