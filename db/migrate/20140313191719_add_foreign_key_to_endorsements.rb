class AddForeignKeyToEndorsements < ActiveRecord::Migration
  def change
  	add_column :endorsements, :recipe_id, :integer
  	#author
  	add_column :endorsements, :user_id, :integer 
  end
end
