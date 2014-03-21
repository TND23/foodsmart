class CreateCookBooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
    	t.integer :user_id, :null => false
    	t.string :saved_recipes
    	t.text :notes
    	t.timestamps
    end
  end
end
