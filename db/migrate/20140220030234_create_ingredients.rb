class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :name, :null => false, :limit => 20
    	t.text :description
    	t.timestamps
    end
    add_index :ingredients, :name, :unique => true
  end
end
