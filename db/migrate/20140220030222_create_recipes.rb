class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      	t.text :instructions, :null => false
    	t.integer :cookbook_id
    	t.integer  :user_id, :null => false
    	t.integer  :ingredient_id
    	t.integer  :utensil_id
      t.string :dishname, :null => false
    	t.timestamps      
    end
  end
end
