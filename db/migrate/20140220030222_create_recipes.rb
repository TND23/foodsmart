class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :instructions, :null => false
      t.text :description
    	t.integer  :user_id, :null => false
      t.string :dishname, :null => false
      t.float :rating
      t.boolean :rated, :null => false, :default => false
    	t.timestamps      
    end
    add_index :recipes, :dishname, :unique => true
    add_index :recipes, :user_id
  end
end
