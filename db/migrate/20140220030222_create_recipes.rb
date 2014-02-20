class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
        t.integer :cookbook_id
      	t.string :instructions, :null => false
    	t.string :author_name, :null => false
    	t.timestamps      
        # t.has_and_belongs_to_many :ingredients
        # t.has_and_belongs_to_many :utensils
        # t.has_and_belongs_to_many :cookbooks
        # t.has_many :endorsements
  
    end
  end
end
