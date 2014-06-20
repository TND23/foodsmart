class AddUsernameIndexToEndorsements < ActiveRecord::Migration
  def change
  	add_column :endorsements, :username, :string
  end
end
