class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
    	t.text :comments, :null => false
    	t.integer  :stars,      limit: 1, :null => false
    	t.integer  :recipe_id, :null => false
    	t.integer  :user_id, :null => false
    	t.timestamps
    end
    add_index :endorsements, :recipe_id
    add_index :endorsements, :user_id
  end
end
