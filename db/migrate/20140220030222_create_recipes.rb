class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :instructions, :null => false
    	t.integer  :user_id, :null => false
      t.string :dishname, :null => false
      t.float :rating
      t.boolean :rated, :default => false
    	t.timestamps      
    end
  end
end
