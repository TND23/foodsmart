class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
    	t.string :name, :null => false, :limit => 20
    	t.text :description, :null => false
    	t.timestamps
    end
    add_index :utensils, :name, :unique => true
  end
end
