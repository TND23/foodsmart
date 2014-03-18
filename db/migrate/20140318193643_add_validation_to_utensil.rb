class AddValidationToUtensil < ActiveRecord::Migration
  def change
  	change_column :utensils, :description, :string, :null => false

  end
end
