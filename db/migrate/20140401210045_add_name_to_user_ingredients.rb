class AddNameToUserIngredients < ActiveRecord::Migration
  def change
  	add_column :user_ingredients, :name, :string
  	remove_column :user_ingredients, :id
  end
end
