class CreateIngredientsUsers < ActiveRecord::Migration
  def change
    create_table :ingredients_users, id: false do |t|
    	t.integer :ingredient_id
    	t.integer :user_id
    end
  end
end
