class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
    	t.string :comments
    	t.timestamps
    end
  end
end
