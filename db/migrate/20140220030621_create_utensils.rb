class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
    	t.string :name, :null => false
    	t.string :description
    	t.timestamps
    end
    add_index :utensils, :name, :unique => true
  end
end
