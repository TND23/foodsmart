class AddAverageRatingToRecipe < ActiveRecord::Migration
  def change
  	add_column :recipes, :integer, :rating
  end
end
