class AddRatedAndFloatToRecipe < ActiveRecord::Migration
  def change
  	change_column :recipes, :rating, :float
  	add_column :recipes, :rated, :boolean, :default => false
  end
end
