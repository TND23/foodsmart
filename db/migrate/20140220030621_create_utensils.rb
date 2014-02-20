class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
    	# t.has_and_belongs_to_many :recipes
    	t.string :name, :null => false
    	t.string :description
    	t.timestamps
    end
    add_index :utensils, :name, :unique => true
  end
end
