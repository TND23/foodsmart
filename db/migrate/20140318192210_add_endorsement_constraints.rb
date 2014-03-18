class AddEndorsementConstraints < ActiveRecord::Migration
  def change
  	change_column :endorsements, :comments, :string, :null => false
  	change_column :endorsements, :stars, :integer, :null => false
  	change_column :endorsements, :comments, :string, :null => false
  end
end
