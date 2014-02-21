class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
        t.integer :cookbook_id
      	t.string :instructions, :null => false
    	t.string :author_name, :null => false
    	t.timestamps      
    end
  end
end
