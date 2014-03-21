class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
    	t.text :comments, :null => false
    	t.integer  :stars,      limit: 1, :null => false
    	t.integer  :recipe_id
    	t.integer  :user_id
    	t.timestamps
    end
  end
end
