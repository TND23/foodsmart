class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, :null => false, :limit => 15
    	t.string :password_digest, :null => false
        t.boolean :admin, :default => false
    	t.string :session_token
    	t.timestamps
    end
    add_index :users, :username, :unique => true
    add_index :users, :session_token, :unique => true
  end
end
