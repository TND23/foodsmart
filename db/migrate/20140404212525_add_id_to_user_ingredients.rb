class AddIdToUserIngredients < ActiveRecord::Migration
  def change
  	add_column :user_ingredients, :id, :primary_key
  end
end
