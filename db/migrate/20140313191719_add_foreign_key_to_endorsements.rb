class AddForeignKeyToEndorsements < ActiveRecord::Migration
  def change
  	add_column :endorsements, :recipe_id, :integer
  end
end
