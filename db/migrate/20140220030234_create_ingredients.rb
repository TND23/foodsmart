class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :name, :null => false
    	t.string :description
    	t.timestamps
    end
    add_index :ingredients, :name, :unique => true
  end
end
